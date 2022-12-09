import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImgeToStorage(
      String childName, Uint8List file, bool isPost) async {
    //we are creating a path here where we are going to store the image
    //the reason we are using  a Uint8List instead of File is to allow both the mobile
    //and web apps work in one same code base
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    // the reason we are using putData instead of putFile is b/c the file type is Uint8List
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    // we are using this url to display the uploaded image by taking it's url
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
