import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/student_binding.dart';
import '../modules/auth/forgot_password_page.dart';
import '../modules/auth/login_page.dart';
import '../modules/auth/register_page.dart';
import '../modules/home/home_page.dart';
import '../modules/splash/splash_page.dart';
import '../modules/student/student_detail_page.dart';
import '../modules/student/student_form_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.splash;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.studentDetail,
      page: () => const StudentDetailPage(),
      binding: StudentBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.studentForm,
      page: () => const StudentFormPage(),
      binding: StudentBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
