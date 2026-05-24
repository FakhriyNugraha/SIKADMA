import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'widgets/auth_layout.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final ok =
        await Get.find<AuthController>().sendPasswordReset(_emailC.text);
    if (ok) Get.back();
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
              title: 'Lupa Password?',
              subtitle:
                  'Masukkan email Anda, kami akan mengirim link reset password.',
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
            const SizedBox(height: 24),
            Obx(
              () => CustomButton(
                label: 'Kirim Link Reset',
                icon: Iconsax.send_1,
                isLoading: auth.isLoading.value,
                onPressed: _submit,
              ),
            ),
            const SizedBox(height: 14),
            CustomButton(
              label: 'Kembali ke Login',
              outlined: true,
              icon: Iconsax.arrow_left_2,
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
