import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_flutter/models/users.dart';

class Post {
  /// we don't need password field in user model because it will be saved as UserCredentials upon signup
  final String description;
  final String uid;
  final String username;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final like;

  Post(
      {required this.description,
      required this.uid,
      required this.username,
      required this.postId,
      required this.datePublished,
      required this.postUrl,
      required this.profImage,
      required this.like});

  Map<String, dynamic> toJson() => {
        "description": username,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        "profImgae": profImage,
        "like": like,
        "postUrl": postUrl,
      };

  ///takes in a documentsnapshot and returns json
  ///on the tutorila this returns a User instance i don't know why? 3:27:15
  static Post fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return Post(
      username: snap['username'],
      uid: snap['uid'],
      description: snap['description'],
      postId: snap['postId'],
      datePublished: snap['datePublished'],
      profImage: snap['profImage'],
      like: snap['like'],
      postUrl: snap['postUrl'],
    );
  }
}
