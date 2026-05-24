import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/student_controller.dart';
import '../../data/models/student_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/confirm_dialog.dart';
import '../../widgets/empty_state_widget.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/mobile_scaffold.dart';
import '../../widgets/statistic_card.dart';
import '../../widgets/student_card.dart';
import 'widgets/filter_bar.dart';
import 'widgets/hero_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _logout() async {
    final ok = await ConfirmDialog.show(
      title: 'Keluar dari Akun?',
      message: 'Anda perlu masuk lagi untuk mengakses data mahasiswa.',
      confirmText: 'Logout',
      icon: Iconsax.logout,
    );
    if (ok) await Get.find<AuthController>().signOut();
  }

  void _openCreate() => Get.toNamed(AppRoutes.studentForm);

  void _openDetail(StudentModel s) =>
      Get.toNamed(AppRoutes.studentDetail, arguments: s);

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final student = Get.find<StudentController>();

    return MobileScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        titleSpacing: 12,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: AppColors.navyGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/logo_unib.png',
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'UNIB StudentHub',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),
                  Text(
                    'Data Mahasiswa',
                    style:
                        TextStyle(fontSize: 11, color: AppColors.mutedText),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: _logout,
            icon: const Icon(Iconsax.logout, color: AppColors.error),
          ),
          const SizedBox(width: 4),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openCreate,
        backgroundColor: AppColors.goldenYellow,
        foregroundColor: AppColors.deepNavy,
        icon: const Icon(Iconsax.user_add),
        label: const Text(
          'Tambah',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeroCard(
              userName: auth.displayName,
              onAdd: _openCreate,
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: 18),
            _StatsGrid(controller: student),
            const SizedBox(height: 18),
            FilterBar(controller: student),
            const SizedBox(height: 18),
            _SectionHeader(controller: student),
            const SizedBox(height: 10),
            _StudentList(
              controller: student,
              onTapStudent: _openDetail,
              onTapAdd: _openCreate,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final StudentController controller;
  const _StatsGrid({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Widget cell(StatisticCard c) => SizedBox(height: 88, child: c);
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: cell(StatisticCard(
                    label: 'Total Mahasiswa',
                    value: '${controller.totalCount}',
                    icon: Iconsax.people,
                    accent: AppColors.academicBlue,
                  )),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: cell(StatisticCard(
                    label: 'Mahasiswa Aktif',
                    value: '${controller.aktifCount}',
                    icon: Iconsax.tick_circle,
                    accent: AppColors.success,
                  )),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: cell(StatisticCard(
                    label: 'Nonaktif',
                    value: '${controller.nonaktifCount}',
                    icon: Iconsax.close_circle,
                    accent: AppColors.error,
                  )),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: cell(StatisticCard(
                    label: 'Program Studi',
                    value: '${controller.programCount}',
                    icon: Iconsax.book_1,
                    accent: AppColors.warmYellow,
                  )),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final StudentController controller;
  const _SectionHeader({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final shown = controller.filteredStudents.length;
        final total = controller.students.length;
        return Row(
          children: [
            const Text(
              'Daftar Mahasiswa',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.darkText,
              ),
            ),
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.academicBlue.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                shown == total ? '$total' : '$shown / $total',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.academicBlue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StudentList extends StatelessWidget {
  final StudentController controller;
  final void Function(StudentModel) onTapStudent;
  final VoidCallback onTapAdd;

  const _StudentList({
    required this.controller,
    required this.onTapStudent,
    required this.onTapAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const ShimmerList(itemCount: 5);
        }
        if (controller.errorMessage.value.isNotEmpty) {
          return EmptyStateWidget(
            icon: Iconsax.warning_2,
            title: 'Gagal Memuat Data',
            message: controller.errorMessage.value,
            actionLabel: 'Coba Lagi',
            onAction: controller.bindStudents,
            accent: AppColors.error,
          );
        }
        if (controller.students.isEmpty) {
          return EmptyStateWidget(
            icon: Iconsax.user_octagon,
            title: 'Belum Ada Data',
            message: 'Tambahkan data mahasiswa pertama Anda.',
            actionLabel: 'Tambah Mahasiswa',
            onAction: onTapAdd,
          );
        }
        final list = controller.filteredStudents;
        if (list.isEmpty) {
          return EmptyStateWidget(
            icon: Iconsax.search_normal,
            title: 'Tidak Ada Hasil',
            message: 'Tidak ada mahasiswa yang cocok dengan pencarian.',
            actionLabel: 'Reset Filter',
            onAction: controller.clearFilters,
          );
        }
        return Column(
          children: [
            for (var i = 0; i < list.length; i++) ...[
              StudentCard(
                student: list[i],
                onTap: () => onTapStudent(list[i]),
              ).animate().fadeIn(duration: 280.ms, delay: (i * 30).ms),
              if (i != list.length - 1) const SizedBox(height: 10),
            ],
          ],
        );
      },
    );
  }
}
