import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

/// Splash screen (PRD §8.1): tampilkan branding ~2 detik, lalu arahkan
/// ke Home jika sudah login, atau Login bila belum.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _scheduleRedirect();
  }

  void _scheduleRedirect() {
    Timer(const Duration(milliseconds: 2000), () {
      if (!mounted) return;
      final auth = Get.find<AuthController>();
      Get.offAllNamed(
        auth.isLoggedIn ? AppRoutes.home : AppRoutes.login,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.navyGradient),
        child: Stack(
          children: [
            // Radial accent kuning lembut (PRD §13.2 gradient hero card).
            Positioned(
              top: -120,
              right: -120,
              child: Container(
                width: 360,
                height: 360,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.goldenYellow.withValues(alpha: 0.18),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/logo_unib.png',
                      width: 96,
                      height: 96,
                    ),
                  )
                      .animate()
                      .scale(
                        duration: 600.ms,
                        curve: Curves.easeOutBack,
                        begin: const Offset(0.6, 0.6),
                      )
                      .fadeIn(duration: 500.ms),
                  const SizedBox(height: 24),
                  const Text(
                    'Data Mahasiswa',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ).animate().fadeIn(delay: 250.ms, duration: 500.ms),
                  const SizedBox(height: 6),
                  const Text(
                    'Smart Academic Data Management',
                    style: TextStyle(
                      color: AppColors.goldenYellow,
                      fontSize: 14,
                    ),
                  ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
                  const SizedBox(height: 36),
                  const SizedBox(
                    width: 26,
                    height: 26,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.6,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.goldenYellow),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
