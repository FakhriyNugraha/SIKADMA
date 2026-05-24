import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/auth_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'widgets/auth_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await Get.find<AuthController>().login(_emailC.text, _passC.text);
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
              title: 'Masuk ke Akun Anda',
              subtitle: 'Kelola data mahasiswa dengan mudah dan aman.',
            ),
            const SizedBox(height: 28),
            CustomTextField(
              controller: _emailC,
              label: 'Email',
              hint: 'admin@unib.ac.id',
              prefixIcon: Iconsax.sms,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.email,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passC,
              label: 'Password',
              hint: 'Minimal 6 karakter',
              prefixIcon: Iconsax.lock,
              isPassword: true,
              validator: Validators.password,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.academicBlue,
                  padding: EdgeInsets.zero,
                ),
                child: const Text('Lupa password?'),
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => CustomButton(
                label: 'Masuk',
                icon: Iconsax.login,
                isLoading: auth.isLoading.value,
                onPressed: _submit,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum punya akun? ',
                  style: TextStyle(color: AppColors.mutedText, fontSize: 13),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.register),
                  child: const Text(
                    'Daftar',
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
