import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../controllers/student_controller.dart';
import '../../data/models/student_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/confirm_dialog.dart';
import '../../widgets/empty_state_widget.dart';
import '../../widgets/mobile_scaffold.dart';
import '../../widgets/status_badge.dart';

/// Halaman detail mahasiswa (mobile).
class StudentDetailPage extends StatelessWidget {
  const StudentDetailPage({super.key});

  String get _id {
    final arg = Get.arguments;
    if (arg is StudentModel) return arg.id;
    if (arg is String) return arg;
    return '';
  }

  Future<void> _onEdit(StudentModel s) async {
    await Get.toNamed(AppRoutes.studentForm, arguments: s);
  }

  Future<void> _onDelete(StudentModel s) async {
    final ok = await ConfirmDialog.show(
      title: 'Hapus Data Mahasiswa?',
      message:
          'Data ${s.name} (${s.npm}) akan dihapus permanen dan tidak dapat dikembalikan.',
      confirmText: 'Hapus',
      icon: Iconsax.trash,
    );
    if (!ok) return;
    final success = await Get.find<StudentController>().deleteStudent(s.id);
    if (success) Get.offAllNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudentController>();
    return MobileScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepNavy,
        foregroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Detail Mahasiswa',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () {
            if (Get.previousRoute.isEmpty) {
              Get.offAllNamed(AppRoutes.home);
            } else {
              Get.back();
            }
          },
          icon: const Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: Obx(
        () {
          final s = c.findById(_id);
          if (s == null) {
            return Center(
              child: EmptyStateWidget(
                icon: Iconsax.warning_2,
                title: 'Data Tidak Ditemukan',
                message: 'Mahasiswa mungkin telah dihapus.',
                actionLabel: 'Kembali ke Beranda',
                onAction: () => Get.offAllNamed(AppRoutes.home),
                accent: AppColors.error,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                _Header(student: s),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _InfoCard(
                        title: 'Informasi Akademik',
                        icon: Iconsax.book_1,
                        items: [
                          _InfoItem(
                              icon: Iconsax.code,
                              label: 'NPM/NIM',
                              value: s.npm),
                          _InfoItem(
                              icon: Iconsax.building,
                              label: 'Fakultas',
                              value: s.faculty),
                          _InfoItem(
                              icon: Iconsax.diagram,
                              label: 'Jurusan',
                              value: s.department),
                          _InfoItem(
                              icon: Iconsax.book,
                              label: 'Program Studi',
                              value: s.studyProgram),
                          _InfoItem(
                              icon: Iconsax.calendar_1,
                              label: 'Angkatan',
                              value: '${s.batchYear}'),
                          _InfoItem(
                              icon: Iconsax.layer,
                              label: 'Semester',
                              value: '${s.semester}'),
                          _InfoItem(
                              icon: Iconsax.medal_star,
                              label: 'IPK',
                              value: s.gpa.toStringAsFixed(2)),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _InfoCard(
                        title: 'Informasi Kontak',
                        icon: Iconsax.call,
                        items: [
                          _InfoItem(
                              icon: Iconsax.sms,
                              label: 'Email',
                              value: s.email),
                          _InfoItem(
                              icon: Iconsax.call,
                              label: 'Nomor Telepon',
                              value: s.phone),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _InfoCard(
                        title: 'Alamat',
                        icon: Iconsax.location,
                        items: [
                          _InfoItem(
                            icon: Iconsax.home_2,
                            label: 'Alamat Lengkap',
                            value: s.address,
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _MetaCard(student: s),
                      const SizedBox(height: 22),
                      _Actions(
                        onEdit: () => _onEdit(s),
                        onDelete: () => _onDelete(s),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final StudentModel student;
  const _Header({required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 26),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.16),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.goldenYellow.withValues(alpha: 0.6),
                width: 2,
              ),
            ),
            child: Text(
              student.initials,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ).animate().scale(
                duration: 400.ms,
                begin: const Offset(0.7, 0.7),
                curve: Curves.easeOutBack,
              ),
          const SizedBox(height: 14),
          Text(
            student.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            student.studyProgram,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.85),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),
          StatusBadge(status: student.status),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_InfoItem> items;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEAECF0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.academicBlue.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, color: AppColors.academicBlue, size: 16),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),
          const Divider(height: 22),
          for (var i = 0; i < items.length; i++) ...[
            items[i],
            if (i != items.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.softGray,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, size: 16, color: AppColors.academicBlue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value.isEmpty ? '-' : value,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetaCard extends StatelessWidget {
  final StudentModel student;
  const _MetaCard({required this.student});

  String _fmt(DateTime? d) {
    if (d == null) return '-';
    return DateFormat('d MMM yyyy, HH:mm', 'id_ID').format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEAECF0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _Meta(
              label: 'Dibuat',
              value: _fmt(student.createdAt),
              icon: Iconsax.calendar_add,
            ),
          ),
          Container(width: 1, height: 32, color: const Color(0xFFEAECF0)),
          Expanded(
            child: _Meta(
              label: 'Diperbarui',
              value: _fmt(student.updatedAt),
              icon: Iconsax.calendar_edit,
            ),
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _Meta({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 13, color: AppColors.mutedText),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _Actions({required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Iconsax.edit, size: 18),
            label: const Text('Edit Data'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.academicBlue,
              foregroundColor: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: onDelete,
            icon: const Icon(Iconsax.trash, size: 18),
            label: const Text('Hapus Data'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error, width: 1.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
