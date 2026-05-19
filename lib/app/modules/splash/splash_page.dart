import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Splash sementara (Tahap 1). Logika cek auth & redirect ditambahkan
/// pada Tahap 3 (Autentikasi).
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.navyGradient),
        child: Center(
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
              ),
              const SizedBox(height: 24),
              const Text(
                'Data Mahasiswa',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Smart Academic Data Management',
                style: TextStyle(color: AppColors.goldenYellow, fontSize: 14),
              ),
              const SizedBox(height: 32),
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.goldenYellow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
