import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginInfo extends ChangeNotifier {
  UserCredential? _credrential;
  String? get userName => _credrential?.user?.displayName;
  bool get loggedIn => _credrential != null;

  User? get user => _credrential?.user;
  void login(String email, String password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((credential) {
      debugPrint(credential.user?.email);
      _credrential = credential;
      notifyListeners();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    _credrential = null;
    notifyListeners();
  }
}
