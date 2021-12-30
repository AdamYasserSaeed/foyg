import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  late double focustime;
  late double remainingTime;
  String currentTime = DateTime.now().toString();
  String currentImageType = 'focus_time1';
  // DateTime differenceInDays = currentTime.difference(focustime).inMinutes;

  TimeProvider() {
    focustime = 20;
    remainingTime = focustime;
  }

  double updateCounter() {
    remainingTime -= 1;
    notifyListeners();

    return remainingTime;
  }

  void start() {
    remainingTime = focustime;
  }

  min() {
    return remainingTime = focustime - 1;
  }
}
