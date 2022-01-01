import 'package:firedart/auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  void addUser(String? email, String? password) {
    auth.signIn(email!, password!);
  }
}
