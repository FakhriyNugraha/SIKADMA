// ignore_for_file: type=lint
//
// ============================================================================
//  TEMPLATE PLACEHOLDER — WAJIB DIGANTI
// ----------------------------------------------------------------------------
//  File ini adalah PLACEHOLDER. Sebelum aplikasi bisa benar-benar terhubung
//  ke Firebase, jalankan perintah berikut di root project ini:
//
//     dart pub global activate flutterfire_cli
//     flutterfire configure
//
//  Login dengan akun: fakhriynugraha26@gmail.com
//  Pilih platform: Web. Perintah itu akan MENIMPA file ini dengan konfigurasi
//  asli (apiKey, appId, projectId, dll). Jangan commit kredensial nyata bila
//  repo bersifat publik.
// ============================================================================

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCcm0aa2qBSdMOnoEzFIO5lI7wxxXgH61M',
    appId: '1:113795128963:web:5641a01d71c36977c345b6',
    messagingSenderId: '113795128963',
    projectId: 'sikadma',
    authDomain: 'sikadma.firebaseapp.com',
    storageBucket: 'sikadma.firebasestorage.app',
    measurementId: 'G-3DSGV8BCQY',
  );

  // Nilai placeholder — diganti otomatis oleh `flutterfire configure`.
}