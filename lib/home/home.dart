import 'package:flutter/material.dart';
import 'package:foyg/core/functions/navigation.dart';
import 'package:foyg/design/buttons/custom_button.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/design/titles/title.dart';
import 'package:foyg/setup/setup_time.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Hero(
              tag: 'img', child: CharecterContainer(type: "focus_time3")),
          CustomButton(
            text: 'Start New Focus Time',
            onTap: () {
              NavigationFunctions.navPush(context, const SetUpTime());
            },
            height: 50,
            width: 200,
          ),
          CustomButton(
            text: 'See Your Sammary',
            onTap: () {},
            height: 50,
            width: 200,
          ),
          const CustomTitle(
            title: 'p o w e r d     b y\n\n   AYATech',
            align: TextAlign.center,
            textColor: Color.fromARGB(255, 87, 87, 87),
            titleSize: 10,
          )
        ],
      ),
    );
  }
}
