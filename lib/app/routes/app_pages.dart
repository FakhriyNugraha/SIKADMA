import 'package:get/get.dart';

import '../modules/splash/splash_page.dart';
import 'app_routes.dart';

/// Daftar GetPage. Route auth & student dilengkapi pada Tahap 3 & 4.
class AppPages {
  AppPages._();

  static const initial = AppRoutes.splash;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
