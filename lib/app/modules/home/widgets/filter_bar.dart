import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/student_controller.dart';
import '../../../data/models/student_model.dart';
import '../../../theme/app_colors.dart';

/// Bilah search + dropdown filter (mobile single column).
class FilterBar extends StatelessWidget {
  final StudentController controller;
  const FilterBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (v) => controller.searchQuery.value = v,
          decoration: InputDecoration(
            hintText: 'Cari nama, NPM, prodi...',
            prefixIcon: const Icon(Iconsax.search_normal,
                color: AppColors.mutedText, size: 20),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFEAECF0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFEAECF0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  const BorderSide(color: AppColors.academicBlue, width: 1.4),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Obx(
                () => _Dropdown(
                  icon: Iconsax.tag,
                  hint: 'Status',
                  value: controller.filterStatus.value.isEmpty
                      ? null
                      : controller.filterStatus.value,
                  items: StudentStatus.all,
                  onChanged: (v) => controller.filterStatus.value = v ?? '',
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Obx(
                () => _Dropdown(
                  icon: Iconsax.book_1,
                  hint: 'Prodi',
                  value: controller.filterStudyProgram.value.isEmpty
                      ? null
                      : controller.filterStudyProgram.value,
                  items: controller.studyProgramOptions,
                  onChanged: (v) =>
                      controller.filterStudyProgram.value = v ?? '',
                ),
              ),
            ),
          ],
        ),
        Obx(() {
          final hasFilter = controller.searchQuery.value.isNotEmpty ||
              controller.filterStatus.value.isNotEmpty ||
              controller.filterStudyProgram.value.isNotEmpty;
          if (!hasFilter) return const SizedBox.shrink();
          return Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: controller.clearFilters,
              icon: const Icon(Iconsax.refresh, size: 14),
              label: const Text('Reset Filter'),
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
            ),
          );
        }),
      ],
    );
  }
}

class _Dropdown extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _Dropdown({
    required this.icon,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      hint: Text(hint,
          style: const TextStyle(
              color: AppColors.mutedText, fontSize: 13)),
      icon: const Icon(Iconsax.arrow_down_1,
          size: 14, color: AppColors.mutedText),
      style: const TextStyle(color: AppColors.darkText, fontSize: 13),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.mutedText, size: 16),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 36, minHeight: 36),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFEAECF0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFEAECF0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              const BorderSide(color: AppColors.academicBlue, width: 1.4),
        ),
      ),
      items: [
        DropdownMenuItem<String>(
          value: null,
          child: Text('Semua $hint',
              style: const TextStyle(
                  color: AppColors.mutedText, fontSize: 13)),
        ),
        ...items.map(
          (e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e, overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
