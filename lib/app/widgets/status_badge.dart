import 'package:flutter/material.dart';

import '../data/models/student_model.dart';
import '../theme/app_colors.dart';

/// Badge warna untuk status mahasiswa.
class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({super.key, required this.status});

  static Color colorOf(String status) {
    switch (status) {
      case StudentStatus.aktif:
        return AppColors.success;
      case StudentStatus.cuti:
        return AppColors.warning;
      case StudentStatus.lulus:
        return AppColors.academicBlue;
      case StudentStatus.nonaktif:
        return AppColors.error;
      default:
        return AppColors.mutedText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = colorOf(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
