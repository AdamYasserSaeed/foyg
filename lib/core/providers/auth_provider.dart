import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:foyg/core/functions/navigation.dart';
import 'package:foyg/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordHidetext = false;

  void loginUser(String? email, String? password) {
    auth.signIn(email!, password!);
  }
}

class SignUpProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  bool passwordHidetext = false;

  void addUser(String? email, String? password, context) async {
    if (passwordController.text == passwordRepeatController.text ||
        passwordController.text.length >= 8) {
      try {
        await auth
            .signUp(email!, password!)
            .then((value) => addUserToDataBase(context));
        final pref = await SharedPreferences.getInstance();
        pref.setString("uid", auth.userId);
      } catch (e) {
        AwesomeDialog(
                context: context, title: '$e', dialogType: DialogType.ERROR)
            .show();
      }
    } else {
      AwesomeDialog(
              context: context,
              title: "There Is errors in your data",
              dialogType: DialogType.ERROR,
              btnOkColor: Colors.red,
              btnOkOnPress: () {})
          .show();
    }
  }

  void addUserToDataBase(context) async {
    Map<String, dynamic> userMap = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'points': 0,
    };

    try {
      firestore.collection('Users').document(auth.userId).create(userMap);

      debugPrint("User Regesterd sucssfuly");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        btnOkOnPress: () {
          NavigationFunctions.navPush(context, const HomeScreen());
        },
        title: 'You have Been Regesterd\nSucssfuly',
      ).show();
    } catch (e) {
      // ignore: avoid_print
      debugPrint(e.toString());
    }
  }
}
