import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/student_controller.dart';
import '../../data/models/student_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/mobile_scaffold.dart';

/// Form tambah/edit mahasiswa (mobile, single column).
/// Get.arguments boleh `StudentModel` (edit) atau `null` (create).
class StudentFormPage extends StatefulWidget {
  const StudentFormPage({super.key});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final StudentModel? _editing;

  final _nameC = TextEditingController();
  final _npmC = TextEditingController();
  final _emailC = TextEditingController();
  final _phoneC = TextEditingController();
  final _facultyC = TextEditingController();
  final _departmentC = TextEditingController();
  final _studyProgramC = TextEditingController();
  final _batchYearC = TextEditingController();
  final _semesterC = TextEditingController();
  final _gpaC = TextEditingController();
  final _addressC = TextEditingController();

  String _status = StudentStatus.aktif;

  @override
  void initState() {
    super.initState();
    final arg = Get.arguments;
    _editing = arg is StudentModel ? arg : null;
    final s = _editing;
    if (s != null) {
      _nameC.text = s.name;
      _npmC.text = s.npm;
      _emailC.text = s.email;
      _phoneC.text = s.phone;
      _facultyC.text = s.faculty;
      _departmentC.text = s.department;
      _studyProgramC.text = s.studyProgram;
      _batchYearC.text = s.batchYear == 0 ? '' : '${s.batchYear}';
      _semesterC.text = s.semester == 0 ? '' : '${s.semester}';
      _gpaC.text = s.gpa == 0.0 ? '' : s.gpa.toStringAsFixed(2);
      _addressC.text = s.address;
      _status = s.status;
    }
  }

  @override
  void dispose() {
    _nameC.dispose();
    _npmC.dispose();
    _emailC.dispose();
    _phoneC.dispose();
    _facultyC.dispose();
    _departmentC.dispose();
    _studyProgramC.dispose();
    _batchYearC.dispose();
    _semesterC.dispose();
    _gpaC.dispose();
    _addressC.dispose();
    super.dispose();
  }

  bool get _isEdit => _editing != null;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final c = Get.find<StudentController>();
    final data = StudentModel(
      id: _editing?.id ?? '',
      name: _nameC.text.trim(),
      npm: _npmC.text.trim(),
      email: _emailC.text.trim(),
      phone: _phoneC.text.trim(),
      faculty: _facultyC.text.trim(),
      department: _departmentC.text.trim(),
      studyProgram: _studyProgramC.text.trim(),
      batchYear: int.tryParse(_batchYearC.text.trim()) ?? 0,
      semester: int.tryParse(_semesterC.text.trim()) ?? 0,
      gpa: double.tryParse(_gpaC.text.trim().replaceAll(',', '.')) ?? 0.0,
      status: _status,
      address: _addressC.text.trim(),
      createdBy: _editing?.createdBy ?? '',
    );

    final ok = _isEdit
        ? await c.updateStudent(_editing!.id, data)
        : await c.createStudent(data);
    if (!ok) return;

    if (_isEdit) {
      Get.offNamed(AppRoutes.studentDetail, arguments: data);
    } else {
      Get.offAllNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudentController>();
    return MobileScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepNavy,
        foregroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          _isEdit ? 'Edit Data Mahasiswa' : 'Tambah Mahasiswa',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Section(
                title: 'Identitas Mahasiswa',
                icon: Iconsax.user,
                children: [
                  CustomTextField(
                    controller: _nameC,
                    label: 'Nama Lengkap',
                    hint: 'Nama mahasiswa',
                    prefixIcon: Iconsax.user,
                    validator: (v) =>
                        Validators.required(v, field: 'Nama'),
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _npmC,
                    label: 'NPM / NIM',
                    hint: 'Contoh: G1A023001',
                    prefixIcon: Iconsax.code,
                    validator: Validators.npm,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _emailC,
                    label: 'Email',
                    hint: 'mahasiswa@email.com',
                    prefixIcon: Iconsax.sms,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _phoneC,
                    label: 'Nomor Telepon',
                    hint: '08xxxxxxxxxx',
                    prefixIcon: Iconsax.call,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: Validators.phone,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _Section(
                title: 'Data Akademik',
                icon: Iconsax.book_1,
                children: [
                  CustomTextField(
                    controller: _facultyC,
                    label: 'Fakultas',
                    hint: 'Mis. Teknik',
                    prefixIcon: Iconsax.building,
                    validator: (v) =>
                        Validators.required(v, field: 'Fakultas'),
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _departmentC,
                    label: 'Jurusan',
                    hint: 'Mis. Informatika',
                    prefixIcon: Iconsax.diagram,
                    validator: (v) =>
                        Validators.required(v, field: 'Jurusan'),
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _studyProgramC,
                    label: 'Program Studi',
                    hint: 'Mis. Informatika',
                    prefixIcon: Iconsax.book,
                    validator: (v) =>
                        Validators.required(v, field: 'Program studi'),
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _batchYearC,
                    label: 'Angkatan',
                    hint: 'Mis. 2023',
                    prefixIcon: Iconsax.calendar_1,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    validator: Validators.batchYear,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _semesterC,
                    label: 'Semester',
                    hint: '1 - 14',
                    prefixIcon: Iconsax.layer,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    validator: Validators.semester,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: _gpaC,
                    label: 'IPK',
                    hint: '0.00 - 4.00',
                    prefixIcon: Iconsax.medal_star,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9.,]')),
                      LengthLimitingTextInputFormatter(4),
                    ],
                    validator: Validators.gpa,
                  ),
                  const SizedBox(height: 14),
                  _StatusDropdown(
                    value: _status,
                    onChanged: (v) => setState(() => _status = v),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _Section(
                title: 'Alamat',
                icon: Iconsax.location,
                children: [
                  CustomTextField(
                    controller: _addressC,
                    label: 'Alamat Lengkap',
                    hint: 'Jalan, kelurahan, kecamatan, kota...',
                    prefixIcon: Iconsax.home_2,
                    maxLines: 3,
                    validator: (v) =>
                        Validators.required(v, field: 'Alamat'),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Obx(
                () => CustomButton(
                  label: _isEdit ? 'Perbarui Data' : 'Simpan Data',
                  icon: _isEdit ? Iconsax.refresh : Iconsax.tick_square,
                  isLoading: c.isSubmitting.value,
                  onPressed: _submit,
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                label: 'Batal',
                outlined: true,
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _Section({
    required this.title,
    required this.icon,
    required this.children,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ...children,
        ],
      ),
    );
  }
}

class _StatusDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  const _StatusDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Status Mahasiswa',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          icon: const Icon(Iconsax.arrow_down_1,
              size: 16, color: AppColors.mutedText),
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.tag,
                size: 20, color: AppColors.mutedText),
          ),
          items: StudentStatus.all
              .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
          validator: (v) =>
              v == null || v.isEmpty ? 'Status wajib dipilih' : null,
        ),
      ],
    );
  }
}
