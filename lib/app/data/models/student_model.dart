import 'package:cloud_firestore/cloud_firestore.dart';

/// Pilihan status mahasiswa (PRD §9.3).
class StudentStatus {
  StudentStatus._();

  static const aktif = 'Aktif';
  static const cuti = 'Cuti';
  static const lulus = 'Lulus';
  static const nonaktif = 'Nonaktif';

  static const all = [aktif, cuti, lulus, nonaktif];
}

/// Model data mahasiswa — collection Firestore `students` (PRD §9.1).
class StudentModel {
  final String id;
  final String name;
  final String npm;
  final String email;
  final String phone;
  final String faculty;
  final String department;
  final String studyProgram;
  final int batchYear;
  final int semester;
  final double gpa;
  final String status;
  final String address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String createdBy;

  const StudentModel({
    this.id = '',
    required this.name,
    required this.npm,
    required this.email,
    required this.phone,
    required this.faculty,
    required this.department,
    required this.studyProgram,
    required this.batchYear,
    required this.semester,
    required this.gpa,
    required this.status,
    required this.address,
    this.createdAt,
    this.updatedAt,
    this.createdBy = '',
  });

  /// Inisial dari nama untuk avatar (maks 2 huruf).
  String get initials {
    final parts =
        name.trim().split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }

  factory StudentModel.fromMap(String id, Map<String, dynamic> map) {
    DateTime? toDate(dynamic v) =>
        v is Timestamp ? v.toDate() : (v is DateTime ? v : null);

    return StudentModel(
      id: id,
      name: (map['name'] ?? '') as String,
      npm: (map['npm'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      faculty: (map['faculty'] ?? '') as String,
      department: (map['department'] ?? '') as String,
      studyProgram: (map['studyProgram'] ?? '') as String,
      batchYear: (map['batchYear'] as num?)?.toInt() ?? 0,
      semester: (map['semester'] as num?)?.toInt() ?? 0,
      gpa: (map['gpa'] as num?)?.toDouble() ?? 0.0,
      status: (map['status'] ?? StudentStatus.aktif) as String,
      address: (map['address'] ?? '') as String,
      createdAt: toDate(map['createdAt']),
      updatedAt: toDate(map['updatedAt']),
      createdBy: (map['createdBy'] ?? '') as String,
    );
  }

  factory StudentModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      StudentModel.fromMap(doc.id, doc.data() ?? <String, dynamic>{});

  /// Map field data (tanpa timestamp — timestamp diatur repository).
  Map<String, dynamic> toMap() => {
        'name': name,
        'npm': npm,
        'email': email,
        'phone': phone,
        'faculty': faculty,
        'department': department,
        'studyProgram': studyProgram,
        'batchYear': batchYear,
        'semester': semester,
        'gpa': gpa,
        'status': status,
        'address': address,
        'createdBy': createdBy,
      };

  StudentModel copyWith({
    String? id,
    String? name,
    String? npm,
    String? email,
    String? phone,
    String? faculty,
    String? department,
    String? studyProgram,
    int? batchYear,
    int? semester,
    double? gpa,
    String? status,
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      npm: npm ?? this.npm,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      faculty: faculty ?? this.faculty,
      department: department ?? this.department,
      studyProgram: studyProgram ?? this.studyProgram,
      batchYear: batchYear ?? this.batchYear,
      semester: semester ?? this.semester,
      gpa: gpa ?? this.gpa,
      status: status ?? this.status,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
