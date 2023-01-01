import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_flutter/models/posts.dart';
import 'package:instagram_flutter/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String desription, Uint8List file, String uid,
      String username, String profImage) async {
    String res = 'some error occured';
    try {
      //this line saves the photo to a storage named posts in firestore cloud
      String postId = const Uuid().v1();
      String postUrl =
          await StorageMethods().uploadImgeToStorage('posts', file, true);

      ///post has it's own model it is not included in the user
      ///the reason for that is it has many information
      Post post = Post(
          description: desription,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: postUrl,
          profImage: profImage,
          like: []);
      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
