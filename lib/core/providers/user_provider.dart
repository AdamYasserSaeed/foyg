import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  void addUser() {
    auth.signInWithEmailAndPassword(
        email: "AdamYasserSaeed@gmail.com", password: "Adam3ayg");
  }
}
