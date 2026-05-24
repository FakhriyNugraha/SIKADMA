import 'dart:async';

import 'package:get/get.dart';

import '../data/app_exception.dart';
import '../data/models/student_model.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/student_repository.dart';
import '../widgets/app_snackbar.dart';

/// Pusat state data mahasiswa (PRD §11.1). Mendengarkan stream Firestore,
/// menangani filter/search, statistik, dan operasi CRUD.
class StudentController extends GetxController {
  StudentController(this._repo, this._authRepo);

  final StudentRepository _repo;
  final AuthRepository _authRepo;

  final RxList<StudentModel> students = <StudentModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  // Filter & search (PRD §4.1 nomor 7-8).
  final RxString searchQuery = ''.obs;
  final RxString filterStatus = ''.obs;
  final RxString filterStudyProgram = ''.obs;

  final RxBool isSubmitting = false.obs;

  StreamSubscription<List<StudentModel>>? _sub;

  @override
  void onInit() {
    super.onInit();
    bindStudents();
  }

  void bindStudents() {
    isLoading.value = true;
    errorMessage.value = '';
    _sub?.cancel();
    _sub = _repo.watchStudents().listen(
      (list) {
        students.assignAll(list);
        isLoading.value = false;
      },
      onError: (Object _) {
        isLoading.value = false;
        errorMessage.value = 'Data mahasiswa gagal dimuat';
      },
    );
  }

  @override
  void onClose() {
    _sub?.cancel();
    super.onClose();
  }

  // ---------- Derivasi ----------

  List<StudentModel> get filteredStudents {
    final q = searchQuery.value.trim().toLowerCase();
    return students.where((s) {
      final matchSearch = q.isEmpty ||
          s.name.toLowerCase().contains(q) ||
          s.npm.toLowerCase().contains(q) ||
          s.department.toLowerCase().contains(q) ||
          s.studyProgram.toLowerCase().contains(q);
      final matchStatus =
          filterStatus.value.isEmpty || s.status == filterStatus.value;
      final matchProgram = filterStudyProgram.value.isEmpty ||
          s.studyProgram == filterStudyProgram.value;
      return matchSearch && matchStatus && matchProgram;
    }).toList();
  }

  List<String> get studyProgramOptions {
    final set = <String>{};
    for (final s in students) {
      if (s.studyProgram.trim().isNotEmpty) set.add(s.studyProgram.trim());
    }
    final list = set.toList()..sort();
    return list;
  }

  int get totalCount => students.length;
  int get aktifCount =>
      students.where((s) => s.status == StudentStatus.aktif).length;
  int get nonaktifCount =>
      students.where((s) => s.status == StudentStatus.nonaktif).length;
  int get programCount => studyProgramOptions.length;

  StudentModel? findById(String id) {
    for (final s in students) {
      if (s.id == id) return s;
    }
    return null;
  }

  void clearFilters() {
    searchQuery.value = '';
    filterStatus.value = '';
    filterStudyProgram.value = '';
  }

  // ---------- CRUD ----------

  Future<bool> createStudent(StudentModel student) async {
    isSubmitting.value = true;
    try {
      if (await _repo.isNpmTaken(student.npm)) {
        AppSnackbar.error('NPM/NIM sudah digunakan oleh mahasiswa lain');
        return false;
      }
      final withCreator =
          student.copyWith(createdBy: _authRepo.currentUser?.uid ?? '');
      await _repo.create(withCreator);
      AppSnackbar.success('Data mahasiswa berhasil ditambahkan');
      return true;
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      return false;
    } catch (_) {
      AppSnackbar.error('Data mahasiswa gagal ditambahkan');
      return false;
    } finally {
      isSubmitting.value = false;
    }
  }

  Future<bool> updateStudent(String id, StudentModel student) async {
    isSubmitting.value = true;
    try {
      if (await _repo.isNpmTaken(student.npm, excludeId: id)) {
        AppSnackbar.error('NPM/NIM sudah digunakan oleh mahasiswa lain');
        return false;
      }
      await _repo.update(id, student);
      AppSnackbar.success('Data mahasiswa berhasil diperbarui');
      return true;
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      return false;
    } catch (_) {
      AppSnackbar.error('Data mahasiswa gagal diperbarui');
      return false;
    } finally {
      isSubmitting.value = false;
    }
  }

  Future<bool> deleteStudent(String id) async {
    try {
      await _repo.delete(id);
      AppSnackbar.success('Data mahasiswa berhasil dihapus');
      return true;
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      return false;
    } catch (_) {
      AppSnackbar.error('Data mahasiswa gagal dihapus');
      return false;
    }
  }
}
