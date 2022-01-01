import 'package:desktoasts/desktoasts.dart';
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

  void timesUp() {
    ToastService? service;

    service = ToastService(
      appName: 'FOYG',
      companyName: 'AYATech',
      productName: 'promodoro',
    );

    Toast toast = Toast(
      type: ToastType.text02,
      title: 'Times Up',
      subtitle: 'Congratulations 🎉🎊',
    );

    service.show(toast);

    notifyListeners();
  }
}
