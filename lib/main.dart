import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase. Pada Tahap 1 firebase_options.dart masih
  // placeholder, jadi error ditangkap agar app tetap bisa dijalankan
  // untuk verifikasi fondasi. Setelah `flutterfire configure`, init sukses.
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase belum terkonfigurasi (placeholder): $e');
  }

  runApp(const UnibStudentHubApp());
}

class UnibStudentHubApp extends StatelessWidget {
  const UnibStudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UNIB StudentHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
