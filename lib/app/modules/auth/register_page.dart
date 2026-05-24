import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/auth_controller.dart';
import '../../theme/app_colors.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'widgets/auth_layout.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final _confirmC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    _confirmC.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await Get.find<AuthController>()
        .register(_nameC.text, _emailC.text, _passC.text);
  }

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return AuthLayout(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthHeader(
              title: 'Buat Akun Admin',
              subtitle: 'Daftar untuk mulai mengelola data mahasiswa.',
            ),
            const SizedBox(height: 28),
            CustomTextField(
              controller: _nameC,
              label: 'Nama Lengkap',
              hint: 'Nama Anda',
              prefixIcon: Iconsax.user,
              validator: Validators.name,
            ),
            const SizedBox(height: 14),
            CustomTextField(
              controller: _emailC,
              label: 'Email',
              hint: 'admin@unib.ac.id',
              prefixIcon: Iconsax.sms,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.email,
            ),
            const SizedBox(height: 14),
            CustomTextField(
              controller: _passC,
              label: 'Password',
              hint: 'Minimal 6 karakter',
              prefixIcon: Iconsax.lock,
              isPassword: true,
              validator: Validators.password,
            ),
            const SizedBox(height: 14),
            CustomTextField(
              controller: _confirmC,
              label: 'Konfirmasi Password',
              hint: 'Ulangi password',
              prefixIcon: Iconsax.lock_1,
              isPassword: true,
              validator: Validators.confirmPassword(() => _passC.text),
            ),
            const SizedBox(height: 22),
            Obx(
              () => CustomButton(
                label: 'Daftar Sekarang',
                icon: Iconsax.user_add,
                isLoading: auth.isLoading.value,
                onPressed: _submit,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah punya akun? ',
                  style: TextStyle(color: AppColors.mutedText, fontSize: 13),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: AppColors.academicBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
