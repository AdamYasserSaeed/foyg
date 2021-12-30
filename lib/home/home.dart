import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:foyg/core/providers/time_provider.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/design/titles/title.dart';
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
    final timeProvider = context.read<TimeProvider>();
    timeProvider.start();
    Timer.periodic(
      const Duration(seconds: 1),
      (t) => setState(() {
        if (timeProvider.remainingTime == 0.0) {
          t.cancel();
        } else {
          timeProvider.updateCounter();
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.read<TimeProvider>();

    return Scaffold(
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
              tag: 'img',
              child: CharecterContainer(type: timeProvider.currentImageType)),
          CustomTitle(
            title:
                "remaining time : \n\n" + timeProvider.remainingTime.toString(),
            align: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomTitle(
                  title: 'You Cant Make anthing in this screen \ntap to cancel',
                  titleSize: 10,
                  textColor: Color.fromARGB(255, 87, 87, 87),
                )),
          )
        ],
      ),
    );
  }
}
