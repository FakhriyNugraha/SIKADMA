import 'package:firebase_auth/firebase_auth.dart';

/// Exception dengan pesan ramah-pengguna (Bahasa Indonesia) sesuai
/// pemetaan error pada PRD §20.
class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;

  /// Map FirebaseAuthException → pesan user (PRD §20 Firebase Auth Error).
  factory AppException.fromAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return const AppException('Email belum terdaftar');
      case 'wrong-password':
      case 'invalid-credential':
        return const AppException('Password yang dimasukkan salah');
      case 'email-already-in-use':
        return const AppException('Email sudah digunakan oleh akun lain');
      case 'weak-password':
        return const AppException('Password minimal 6 karakter');
      case 'invalid-email':
        return const AppException('Format email tidak valid');
      case 'network-request-failed':
        return const AppException('Koneksi bermasalah, coba lagi');
      case 'too-many-requests':
        return const AppException(
            'Terlalu banyak percobaan, coba beberapa saat lagi');
      default:
        return AppException(e.message ?? 'Terjadi kesalahan autentikasi');
    }
  }
}
