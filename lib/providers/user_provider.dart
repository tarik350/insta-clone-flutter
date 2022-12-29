import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/users.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    print('-0-=-=0-0 refresh start');
    User user = await _authMethods.getUserDetails();
    print('reg`');
    _user = user;

    notifyListeners();
  }
}
