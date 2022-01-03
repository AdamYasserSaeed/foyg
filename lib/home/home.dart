import 'package:flutter/material.dart';
import 'package:foyg/core/functions/navigation.dart';
import 'package:foyg/core/providers/time_provider.dart';
import 'package:foyg/core/providers/user_provider.dart';
import 'package:foyg/counting/counting_screen.dart';
import 'package:foyg/design/buttons/custom_button.dart';
import 'package:foyg/design/containers/custom_container.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/design/titles/title.dart';
import 'package:foyg/setup/setup_time.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserProvider>();
    final timeprovider = context.read<TimeProvider>();

    return Scaffold(
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomContainer(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.1,
              isParent: true,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitle(
                      title: "Your Points",
                      textColor: Colors.white,
                      titleSize: 35,
                    ),
                    const SizedBox(height: 20),
                    CustomTitle(
                      title: userData.userName.toString(),
                      textColor: Colors.white,
                      titleSize: 35,
                    ),
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (timeprovider.focustime == 5) {
                      } else {
                        timeprovider.focustime = timeprovider.focustime - 5;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove_rounded)),
              Hero(
                tag: 'title',
                child: CustomTitle(
                  title: "   " +
                      timeprovider.focustime.toInt().toString() +
                      " min   ",
                  titleSize: 25,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      timeprovider.focustime = timeprovider.focustime + 5;
                    });
                  },
                  icon: const Icon(Icons.add_rounded)),
            ],
          ),
          CustomButton(
            text: 'Start',
            onTap: () {
              NavigationFunctions.navPush(context, CountingScreen());
            },
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
