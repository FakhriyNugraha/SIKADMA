import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../data/repositories/auth_repository.dart';

/// Binding untuk halaman-halaman auth (PRD §11.3).
/// AuthController biasanya sudah disuntik oleh InitialBinding sebagai
/// permanent; binding ini idempoten — hanya mengisi jika belum ada
/// (mis. saat halaman dibuka langsung lewat URL).
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthRepository>()) {
      Get.put<AuthRepository>(AuthRepository(), permanent: true);
    }
    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(
        AuthController(Get.find<AuthRepository>()),
        permanent: true,
      );
    }
  }
}
