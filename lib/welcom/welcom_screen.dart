import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foyg/auth/login/login.dart';
import 'package:foyg/auth/signup/signup.dart';
import 'package:foyg/core/functions/navigation.dart';
import 'package:foyg/core/providers/theme_provider.dart';
import 'package:foyg/design/buttons/custom_button.dart';
import 'package:foyg/design/containers/custom_container.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/design/titles/title.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.height;

    final themeProvider = context.read<Themeprovider>();

    Key? scaffoldKey;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Hero(
            tag: 'img',
            child: CharecterContainer(
              type: 'wave',
              height: deviceSize / 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomContainerWithButton(
              buttontext: 'Get Started',
              buttonheight: deviceSize / 20,
              buttonwidth: deviceSize / 3.5,
              width: deviceSize / 3,
              height: deviceSize / 3.5,
              onTap: () {
                showdialog(context, scaffoldKey, themeProvider);
              },
            ),
          ),
        ],
      ),
    );
  }

  showdialog(context, scaffoldKey, themeProvider) {
    return AwesomeDialog(
      dialogBackgroundColor: const Color(0xffAFAFAF),
      context: context,
      aligment: Alignment.center,
      dialogType: DialogType.NO_HEADER,
      body: SizedBox(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CharecterContainer(
              type: 'think',
              height: 300,
            ),
            CustomButton(
              height: 40,
              width: 200,
              text: 'Login',
              onTap: () {
                NavigationFunctions.navPush(context, const LoginScreen());
              },
            ),
            const CustomTitle(
              title: 'or',
              textColor: Color.fromARGB(255, 87, 87, 87),
              titleSize: 10,
            ),
            CustomButton(
              height: 40,
              width: 200,
              text: 'Signup',
              onTap: () {
                NavigationFunctions.navPush(context, const SignUpScreen());
              },
            ),
          ],
        ),
      ),
    ).show();
  }
}
