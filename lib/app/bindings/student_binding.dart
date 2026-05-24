import 'package:get/get.dart';

import '../controllers/student_controller.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/student_repository.dart';

/// Binding untuk halaman student-detail & student-form (PRD §11.3).
/// Idempoten: hanya register bila controller/repo belum ada (mis. saat
/// dibuka langsung lewat URL).
class StudentBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<StudentRepository>()) {
      Get.put<StudentRepository>(StudentRepository(), permanent: true);
    }
    if (!Get.isRegistered<StudentController>()) {
      Get.put<StudentController>(
        StudentController(
          Get.find<StudentRepository>(),
          Get.find<AuthRepository>(),
        ),
        permanent: true,
      );
    }
  }
}
