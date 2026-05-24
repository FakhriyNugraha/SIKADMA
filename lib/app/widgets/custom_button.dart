import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Tombol utama bergradien kuning dengan state loading,
/// plus varian outline (PRD §13.5).
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool outlined;
  final IconData? icon;
  final double height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.outlined = false,
    this.icon,
    this.height = 52,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = isLoading || onPressed == null;

    final child = isLoading
        ? const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.6,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.deepNavy),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );

    if (outlined) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: OutlinedButton(
          onPressed: disabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.academicBlue,
            side: const BorderSide(color: AppColors.academicBlue, width: 1.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: child,
        ),
      );
    }

    return Opacity(
      opacity: disabled && !isLoading ? 0.6 : 1,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.yellowGradient,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.warmYellow.withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: disabled ? null : onPressed,
            child: Center(
              child: DefaultTextStyle.merge(
                style: const TextStyle(color: AppColors.deepNavy),
                child: IconTheme.merge(
                  data: const IconThemeData(color: AppColors.deepNavy),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
