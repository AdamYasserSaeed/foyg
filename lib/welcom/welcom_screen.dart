import 'package:flutter/material.dart';
import 'package:foyg/design/containers/custom_container.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/setup/setup_time.dart';
import 'package:foyg/core/functions/navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Key? scaffoldKey;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Hero(tag: 'img', child: CharecterContainer(type: 'wave')),
          Hero(
            tag: 'button',
            child: CustomContainerWithButton(
              text:
                  "Hi , MY Name is Ludo\nI well be your friend\nI hop You Like it",
              buttontext: 'Get Started',
              width: 300,
              onTap: () =>
                  NavigationFunctions.navPush(context, const SetUpTime()),
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
