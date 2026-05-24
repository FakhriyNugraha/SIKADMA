import 'package:cloud_firestore/cloud_firestore.dart';

/// Model profil user aplikasi — collection Firestore `users` (PRD §9.2).
class UserModel {
  final String uid;
  final String name;
  final String email;
  final DateTime? createdAt;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.createdAt,
  });

  factory UserModel.fromMap(String uid, Map<String, dynamic> map) {
    final raw = map['createdAt'];
    return UserModel(
      uid: uid,
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      createdAt: raw is Timestamp ? raw.toDate() : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'email': email,
      };
}
