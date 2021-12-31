import 'package:flutter/material.dart';
import 'package:foyg/core/functions/navigation.dart';
import 'package:foyg/core/providers/time_provider.dart';
import 'package:foyg/counting/counting_screen.dart';
import 'package:foyg/design/buttons/floting_button.dart';
import 'package:foyg/design/containers/main_character_container.dart';
import 'package:foyg/design/sliders/sliders.dart';
import 'package:foyg/design/titles/title.dart';
import 'package:foyg/home/home.dart';
import 'package:provider/provider.dart';

class SetUpTime extends StatefulWidget {
  const SetUpTime({Key? key}) : super(key: key);

  @override
  _SetUpTimeState createState() => _SetUpTimeState();
}

class _SetUpTimeState extends State<SetUpTime> {
  @override
  Widget build(BuildContext context) {
    final timeProvider = context.read<TimeProvider>();

    return Scaffold(
      floatingActionButton: FlotingButton(
        iconData: Icons.arrow_right_rounded,
        onPress: () =>
            NavigationFunctions.navReplacement(context, CountingScreen()),
      ),
      backgroundColor: const Color(0xffAFAFAF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Hero(
            tag: 'img',
            child: CharecterContainer(
                type: (timeProvider.focustime == 30 ||
                        timeProvider.focustime <= 30)
                    ? 'focus_time1'
                    : (timeProvider.focustime == 50 ||
                            timeProvider.focustime <= 50)
                        ? 'focus_time2'
                        : (timeProvider.focustime == 60 ||
                                timeProvider.focustime <= 60)
                            ? 'focus_time3'
                            : 'focus_time3'),
          ),
          const CustomTitle(title: "Set Up Time to focus"),
          CustomTitle(
              title: timeProvider.focustime.toInt().toString() + " min"),
          CustomSlider(
            value: timeProvider.focustime,
            minTime: 10,
            maxTime: 60,
            onUpdate: (value) {
              setState(() {
                timeProvider.focustime = value!;
                (timeProvider.focustime == 30 || timeProvider.focustime <= 30)
                    ? timeProvider.currentImageType = 'focus_time1'
                    : (timeProvider.focustime == 50 ||
                            timeProvider.focustime <= 50)
                        ? timeProvider.currentImageType = 'focus_time2'
                        : (timeProvider.focustime == 60 ||
                                timeProvider.focustime <= 60)
                            ? timeProvider.currentImageType = 'focus_time3'
                            : timeProvider.currentImageType = 'focus_time3';
              });
            },
          )
        ],
      ),
    );
  }
}
