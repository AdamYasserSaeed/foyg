import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foyg/core/providers/time_provider.dart';
import 'package:foyg/core/providers/user_provider.dart';
import 'package:foyg/design/buttons/custom_button.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/design/titles/title.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CountingScreen extends StatefulWidget {
  late Timer? timer;

  CountingScreen({Key? key, this.timer}) : super(key: key);

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  @override
  void initState() {
    super.initState();
    final timeProvider = context.read<TimeProvider>();
    timeProvider.start();
    widget.timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) => setState(() {
        if (timeProvider.remainingTime == 0.0) {
          widget.timer!.cancel();
          timeProvider.timesUp();
          timeProvider.currentImageType = 'celebration';
        } else {
          timeProvider.updateCounter();
        }
      }),
    );
    widget.timer;
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.read<TimeProvider>();
    final userProvider = context.read<UserProvider>();

    return Scaffold(
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Hero(
              tag: 'img',
              child: CharecterContainer(type: timeProvider.currentImageType)),
          const Spacer(),
          CustomTitle(
            title: (timeProvider.remainingTime <= 0.0)
                ? ""
                : "Goal : \n\n" +
                    "Focus " +
                    timeProvider.focustime.toInt().toString() +
                    " min",
            align: TextAlign.center,
          ),
          const Spacer(),
          CustomTitle(
            title: (timeProvider.remainingTime <= 0.0)
                ? "Congratulations You Complet\nThe Focus time"
                : "remaining time : \n\n" +
                    timeProvider.remainingTime.toInt().toString() +
                    " min",
            align: TextAlign.center,
          ),
          const Spacer(),
          (timeProvider.remainingTime <= 0.0)
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CustomButton(
                    onTap: () {
                      userProvider.addUser();
                    },
                    height: 50,
                    text: "Great!",
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(context);
                      },
                      child: const CustomTitle(
                        title:
                            'You Cant Make anthing in this screen \ntap to cancel',
                        titleSize: 10,
                        textColor: Color.fromARGB(255, 87, 87, 87),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  showDialog(context) async {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(28.0),
          child: Text(
            'do you really want to cancel',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      btnOkOnPress: () {
        widget.timer!.cancel();
      },
      btnCancelColor: Colors.green,
      btnCancelOnPress: () {},
      btnOkColor: Colors.red,
    )..show();
  }
}
