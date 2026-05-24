/// Kumpulan validator form (PRD §19).
class Validators {
  Validators._();

  static final _emailRegex =
      RegExp(r'^[\w\.\-+]+@([\w\-]+\.)+[\w\-]{2,}$');

  static String? required(String? v, {String field = 'Field'}) {
    if (v == null || v.trim().isEmpty) return '$field wajib diisi';
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email wajib diisi';
    if (!_emailRegex.hasMatch(v.trim())) return 'Format email tidak valid';
    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Password wajib diisi';
    if (v.length < 6) return 'Password minimal 6 karakter';
    return null;
  }

  static String? Function(String?) confirmPassword(String Function() original) {
    return (v) {
      if (v == null || v.isEmpty) return 'Konfirmasi password wajib diisi';
      if (v != original()) return 'Konfirmasi password tidak sama';
      return null;
    };
  }

  static String? name(String? v) {
    if (v == null || v.trim().isEmpty) return 'Nama wajib diisi';
    if (v.trim().length < 3) return 'Nama minimal 3 karakter';
    return null;
  }

  static String? phone(String? v) {
    if (v == null || v.trim().isEmpty) return 'Nomor telepon wajib diisi';
    final digits = v.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10) return 'Nomor telepon minimal 10 digit';
    return null;
  }

  static String? npm(String? v) {
    if (v == null || v.trim().isEmpty) return 'NPM/NIM wajib diisi';
    if (v.trim().length < 4) return 'NPM/NIM tidak valid';
    return null;
  }

  static String? batchYear(String? v) {
    if (v == null || v.trim().isEmpty) return 'Angkatan wajib diisi';
    final n = int.tryParse(v.trim());
    final now = DateTime.now().year;
    if (n == null || n < 1980 || n > now) return 'Angkatan tidak valid';
    return null;
  }

  static String? semester(String? v) {
    if (v == null || v.trim().isEmpty) return 'Semester wajib diisi';
    final n = int.tryParse(v.trim());
    if (n == null || n < 1 || n > 14) return 'Semester harus 1 sampai 14';
    return null;
  }

  static String? gpa(String? v) {
    if (v == null || v.trim().isEmpty) return 'IPK wajib diisi';
    final n = double.tryParse(v.trim().replaceAll(',', '.'));
    if (n == null || n < 0 || n > 4) return 'IPK harus 0.00 sampai 4.00';
    return null;
  }
}
