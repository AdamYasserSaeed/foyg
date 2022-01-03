import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String? userName;
  String? userEmail;
  double? userpoints;

  void getUserData() async {
    Firestore firestore = Firestore.instance;

    final preferences = await SharedPreferences.getInstance();

    String uid = preferences.getString('uid').toString();

    firestore.collection("Users").where(uid).get().then((value) {
      userName = value[0]['name'];
      userEmail = value[0]['email'];
      userpoints = value[0]['points'];
    });
  }
}
