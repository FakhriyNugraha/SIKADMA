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

  // Nilai placeholder — diganti otomatis oleh `flutterfire configure`.
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'PLACEHOLDER_API_KEY',
    appId: 'PLACEHOLDER_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'PLACEHOLDER_PROJECT_ID',
    authDomain: 'PLACEHOLDER_PROJECT_ID.firebaseapp.com',
    storageBucket: 'PLACEHOLDER_PROJECT_ID.appspot.com',
  );
}
