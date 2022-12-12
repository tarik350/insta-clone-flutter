import 'package:flutter/foundation.dart';

class User {
  final String username;
  final String bio;
  final String password;
  final String email;
  final String photoUrl;
  final List followers;
  final List following;

  User(
      {required this.email,
      required this.bio,
      required this.password,
      required this.username,
      required this.followers,
      required this.following,
      required this.photoUrl});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "bio": bio,
        "password": password,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following
      };
}
