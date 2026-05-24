import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

/// Notifikasi snackbar konsisten berbasis GetX (PRD §11.5).
class AppSnackbar {
  AppSnackbar._();

  static void success(String message, {String title = 'Berhasil'}) {
    _show(title, message, AppColors.success, Icons.check_circle_outline);
  }

  static void error(String message, {String title = 'Gagal'}) {
    _show(title, message, AppColors.error, Icons.error_outline);
  }

  static void info(String message, {String title = 'Info'}) {
    _show(title, message, AppColors.academicBlue, Icons.info_outline);
  }

  static void _show(
    String title,
    String message,
    Color color,
    IconData icon,
  ) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      colorText: AppColors.white,
      icon: Icon(icon, color: AppColors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 14,
      duration: const Duration(seconds: 3),
    );
  }
}
