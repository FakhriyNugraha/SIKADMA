import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../data/app_exception.dart';
import '../data/repositories/auth_repository.dart';
import '../routes/app_routes.dart';
import '../widgets/app_snackbar.dart';
import 'student_controller.dart';

/// Pusat state autentikasi (PRD §11.1). Permanen sepanjang app berjalan;
/// di-bind oleh InitialBinding sehingga splash & semua halaman bisa
/// memanggil `Get.find<AuthController>()`.
class AuthController extends GetxController {
  AuthController(this._repo);

  final AuthRepository _repo;

  final Rxn<User> firebaseUser = Rxn<User>();
  final RxBool isLoading = false.obs;

  bool get isLoggedIn => firebaseUser.value != null;
  String get displayName =>
      firebaseUser.value?.displayName?.trim().isNotEmpty == true
          ? firebaseUser.value!.displayName!
          : (firebaseUser.value?.email?.split('@').first ?? 'Admin');

  @override
  void onInit() {
    super.onInit();
    firebaseUser.value = _repo.currentUser;
    firebaseUser.bindStream(_repo.authStateChanges());
  }

  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    try {
      await _repo.login(email, password);
      AppSnackbar.success('Selamat datang kembali!');
      Get.offAllNamed(AppRoutes.home);
      return true;
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      return false;
    } catch (_) {
      AppSnackbar.error('Terjadi kesalahan, coba lagi');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    isLoading.value = true;
    try {
      await _repo.register(name, email, password);
      AppSnackbar.success('Akun berhasil dibuat');
      Get.offAllNamed(AppRoutes.home);
      return true;
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      return false;
    } catch (_) {
      AppSnackbar.error('Terjadi kesalahan, coba lagi');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> sendPasswordReset(String email) async {
    isLoading.value = true;
    try {
      await _repo.sendPasswordReset(email);
      AppSnackbar.success(
        'Link reset password telah dikirim ke $email',
        title: 'Email Terkirim',
      );
      return true;
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      return false;
    } catch (_) {
      AppSnackbar.error('Terjadi kesalahan, coba lagi');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _repo.signOut();
    // Bersihkan state student agar data user lama tidak bocor ke session
    // berikutnya. HomeBinding akan membuat ulang saat login lagi.
    if (Get.isRegistered<StudentController>()) {
      await Get.delete<StudentController>(force: true);
    }
    Get.offAllNamed(AppRoutes.login);
  }
}
