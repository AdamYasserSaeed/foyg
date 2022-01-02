import 'package:flutter/material.dart';
import 'package:foyg/auth/signup/fileds.dart';
import 'package:foyg/design/containers/main_character_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = context.read<Themeprovider>();

    Key? scaffoldKey;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffAFAFAF),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Column(
            children: const [
              Hero(tag: 'img', child: CharecterContainer(type: 'focus_time2')),
              Fields(),
            ],
          ),
        ),
      ),
    );
  }
}
