import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_flutter/models/users.dart' as model;
import 'package:instagram_flutter/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    ///fromsnap converts docsnapshot to json format
    return model.User.fromSnap(snap);
  }

  //sign up users

  Future<String> signupUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user -- which means authentication
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // print(credential.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImgeToStorage('profilePics', file, false);
        //first we created a user model -- in order to save it on db collection
        model.User user = model.User(
          bio: bio,
          uid: _auth.currentUser!.uid,
          username: username,
          email: email,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        //add user to our database
        // this is a more preferred option but both do the same thing
        //we simply converted the above user model to a json and added to 'users' collection
        await _firestore.collection('users').doc(credential.user!.uid).set(
              user.toJson(),
            );

        //another way of doing the same thing

        // await _firestore.collection('users').add({
        //   'username': username,
        //   'uid': credential.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': []
        // });

        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //logging user in
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'please enter all the fields';
      }
    }
    //// if you want to display custom error messages for users this is how you do it
    // on FirebaseAuthException catch(err){
    //   if(err.code == 'wrong-password'){
    //     //do something here
    //   }
    // }
    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
