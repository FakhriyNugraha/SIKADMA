import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_exception.dart';
import '../models/student_model.dart';

/// Akses CRUD data mahasiswa di Cloud Firestore (PRD §10.2).
class StudentRepository {
  StudentRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _col =>
      _firestore.collection('students');

  /// Stream realtime daftar mahasiswa, terbaru di atas (PRD §8.5).
  Stream<List<StudentModel>> watchStudents() {
    return _col.orderBy('createdAt', descending: true).snapshots().map(
          (snap) => snap.docs.map(StudentModel.fromDoc).toList(),
        );
  }

  Future<StudentModel?> getById(String id) async {
    try {
      final doc = await _col.doc(id).get();
      if (!doc.exists) return null;
      return StudentModel.fromDoc(doc);
    } on FirebaseException {
      throw const AppException('Data mahasiswa gagal dimuat');
    }
  }

  /// Cek keunikan NPM/NIM (PRD §18 business rule 2).
  Future<bool> isNpmTaken(String npm, {String? excludeId}) async {
    final snap = await _col.where('npm', isEqualTo: npm.trim()).get();
    return snap.docs.any((d) => d.id != excludeId);
  }

  Future<void> create(StudentModel student) async {
    try {
      await _col.add({
        ...student.toMap(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException {
      throw const AppException('Data mahasiswa gagal ditambahkan');
    }
  }

  Future<void> update(String id, StudentModel student) async {
    try {
      await _col.doc(id).update({
        ...student.toMap(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException {
      throw const AppException('Data mahasiswa gagal diperbarui');
    }
  }

  Future<void> delete(String id) async {
    try {
      await _col.doc(id).delete();
    } on FirebaseException {
      throw const AppException('Data mahasiswa gagal dihapus');
    }
  }
}
