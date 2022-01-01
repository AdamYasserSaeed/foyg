import 'package:flutter/material.dart';
import 'package:foyg/auth/login/fileds.dart';
import 'package:foyg/design/containers/main_character_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = context.read<Themeprovider>();

    Key? scaffoldKey;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        children: const [
          Hero(tag: 'img', child: CharecterContainer(type: 'focus_time2')),
          Expanded(child: Fields()),
        ],
      ),
    );
  }
}
