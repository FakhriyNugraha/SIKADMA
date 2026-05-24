import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../app_exception.dart';
import '../models/user_model.dart';

/// Akses Firebase Authentication + profil user di Firestore (PRD §10.1).
class AuthRepository {
  AuthRepository({FirebaseAuth? auth, FirebaseFirestore? firestore})
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<UserCredential> login(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AppException.fromAuth(e);
    }
  }

  Future<UserCredential> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await cred.user?.updateDisplayName(name.trim());

      final uid = cred.user!.uid;
      final profile = UserModel(uid: uid, name: name.trim(), email: email.trim());
      await _firestore.collection('users').doc(uid).set({
        ...profile.toMap(),
        'createdAt': FieldValue.serverTimestamp(),
      });
      return cred;
    } on FirebaseAuthException catch (e) {
      throw AppException.fromAuth(e);
    }
  }

  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw AppException.fromAuth(e);
    }
  }

  Future<void> signOut() => _auth.signOut();
}
