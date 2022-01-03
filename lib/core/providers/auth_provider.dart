import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:foyg/core/functions/navigation.dart';

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
            .then((value) => addUserToDataBase());
      } catch (e) {
        AwesomeDialog(
                context: context,
                title: 'error : $e',
                dialogType: DialogType.ERROR)
            .show();
      }
    } else {
      AwesomeDialog(
          context: context,
          title: "There Is errors in your data",
          dialogType: DialogType.ERROR,
          btnOkColor: Colors.red,
          btnOkOnPress: () {
            NavigationFunctions.pop(context);
          }).show();
    }
  }

  void addUserToDataBase() async {
    Map<String, dynamic> userMap = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'forest': [],
    };

    try {
      firestore.collection('Users').document(auth.userId).create(userMap);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

class UserProvider extends ChangeNotifier {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // firestore.collection("Users").document(auth.userId).get().then((value) => {value.});

  String? userName;

  String? userEmail;

  String? userPassword;
}
