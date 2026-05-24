import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/student_controller.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/student_repository.dart';

/// Binding untuk Home/Dashboard (PRD §11.3).
/// Memastikan AuthController + StudentController siap. Idempoten —
/// hanya register bila belum ada.
class HomeBinding extends Bindings {
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
