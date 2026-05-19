import 'package:flutter/material.dart';

/// Palet warna aplikasi sesuai PRD §13.2 (navy & kuning).
class AppColors {
  AppColors._();

  static const Color deepNavy = Color(0xFF071A3D);
  static const Color royalNavy = Color(0xFF0B2A5B);
  static const Color academicBlue = Color(0xFF114B9A);
  static const Color goldenYellow = Color(0xFFFFD529);
  static const Color warmYellow = Color(0xFFFFB800);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softGray = Color(0xFFF5F7FB);
  static const Color darkText = Color(0xFF101828);
  static const Color mutedText = Color(0xFF667085);

  static const Color success = Color(0xFF12B76A);
  static const Color error = Color(0xFFE5484D);
  static const Color warning = Color(0xFFF79009);

  /// Gradient utama navy.
  static const LinearGradient navyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [deepNavy, royalNavy, academicBlue],
  );

  /// Gradient kuning untuk aksen button.
  static const LinearGradient yellowGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [goldenYellow, warmYellow],
  );

  /// Gradient hero card.
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [deepNavy, academicBlue],
  );
}
