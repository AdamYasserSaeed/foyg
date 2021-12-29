import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  double focustime = 20;
  DateTime currentTime = DateTime.now();
  String currentImageType = 'focus_time1';
  // DateTime differenceInDays = currentTime.difference(focustime).inMinutes;
}
