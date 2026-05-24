import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../data/repositories/auth_repository.dart';

/// Binding global: tersedia sejak splash sampai seluruh siklus aplikasi.
/// Dipasang via `GetMaterialApp.initialBinding` di main.dart.
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepository(), permanent: true);
    Get.put<AuthController>(
      AuthController(Get.find<AuthRepository>()),
      permanent: true,
    );
  }
}
