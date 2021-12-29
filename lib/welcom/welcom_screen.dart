import 'package:flutter/material.dart';
import 'package:foyg/design/buttons/custom_button.dart';
import 'package:foyg/design/containers/custom_container.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/setup/setup_time.dart';
import 'package:foyg/design/titles/title.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Hero(tag: 'img', child: const CharecterContainer(type: 'wave')),
          CustomContainer(
            isParent: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomTitle(),
                CustomButton(
                  height: 45,
                  width: 250,
                  onTap: () => NavigationFunctions()
                      .navPush(context, const SetUpTime()),
                  isParent: true,
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.farro(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  color: const Color(0xffffffff),
                ),
              ],
            ),
            width: 300,
            height: 200,
            color: const Color(0xff5C8FAC),
          ),
        ],
      ),
    );
  }
}
