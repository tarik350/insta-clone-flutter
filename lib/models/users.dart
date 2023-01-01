import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User {
  /// we don't need password field in user model because it will be saved as UserCredentials upon signup
  final String username;
  final String bio;
  final String uid;
  final String email;
  final String photoUrl;
  final List followers;
  final List following;

  User(
      {required this.email,
      required this.bio,
      required this.uid,
      required this.username,
      required this.followers,
      required this.following,
      required this.photoUrl});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "bio": bio,
        'uid': uid,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following
      };

  ///takes in a documentsnapshot and returns json
  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return User(
        email: snap['email'],
        bio: snap['bio'],
        uid: snap['uid'],
        username: snap['username'],
        followers: snap['followers'],
        following: snap['following'],
        photoUrl: snap['photoUrl']);
  }
}
