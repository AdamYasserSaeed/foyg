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
    double deviceSize = MediaQuery.of(context).size.height;

    final authProvider = context.read<LoginProvider>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CustomTextFiled(
              title: "Email",
              textController: authProvider.emailController,
              icon: const SizedBox(),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              title: "Password",
              textController: authProvider.passwordController,
              iconOnTap: () {
                setState(() {
                  authProvider.passwordHidetext =
                      !authProvider.passwordHidetext;
                });
              },
              icon: const Icon(Icons.remove_red_eye),
              isPassword: authProvider.passwordHidetext,
            ),
            const Spacer(),
            CustomButton(
              text: 'Login',
              onTap: () {
                authProvider.loginUser(authProvider.emailController.text,
                    authProvider.passwordController.text);
              },
              height: deviceSize / 15,
            ),
          ],
        ),
      ),
    );
  }
}
