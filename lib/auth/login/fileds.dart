import 'package:firedart/auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foyg/core/providers/auth_provider.dart';
import 'package:foyg/design/buttons/custom_button.dart';
import 'package:foyg/design/fields/custom_text_field.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class Fields extends StatefulWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  _FieldsState createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    bool passwordHidetext = false;

    double deviceSize = MediaQuery.of(context).size.height;

    final authProvider = context.read<AuthProvider>();

    String? email;
    String? password;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CustomTextFiled(
              title: "Email",
              onSubmit: (val) {
                setState(() {
                  email = val;
                });
              },
              icon: const SizedBox(),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              title: "Password",
              onSubmit: (val) {
                setState(() {
                  password = val;
                });
              },
              iconOnTap: () {
                setState(() {
                  passwordHidetext = !passwordHidetext;
                });
              },
              icon: const Icon(Icons.remove_red_eye),
              isPassword: passwordHidetext,
            ),
            const Spacer(),
            CustomButton(
              text: 'Login',
              onTap: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signIn(email ?? '', password ?? '');
              },
              height: deviceSize / 15,
            ),
          ],
        ),
      ),
    );
  }
}
