import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../theme/app_colors.dart';

/// Hero card dashboard mobile: greeting + tombol tambah.
class HeroCard extends StatelessWidget {
  final String userName;
  final VoidCallback onAdd;

  const HeroCard({super.key, required this.userName, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepNavy.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Opacity(
              opacity: 0.10,
              child: Image.asset(
                'assets/images/logo_unib.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, $userName! 👋',
                style: const TextStyle(
                  color: AppColors.goldenYellow,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Kelola Data\nMahasiswa',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tambah, cari, perbarui & hapus data mahasiswa dengan cepat.',
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.85),
                  fontSize: 12.5,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              _AddButton(onPressed: onAdd),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _AddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.yellowGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.warmYellow.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Iconsax.user_add, color: AppColors.deepNavy, size: 18),
                SizedBox(width: 8),
                Text(
                  'Tambah Mahasiswa',
                  style: TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
