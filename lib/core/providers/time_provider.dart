import 'package:desktoasts/desktoasts.dart';
import 'package:flutter/material.dart';
import 'package:foyg/counting/counting_screen.dart';
import 'package:locally/locally.dart';

class TimeProvider extends ChangeNotifier {
  late double focustime;
  late double remainingTime;
  String currentTime = DateTime.now().toString();
  String currentImageType = 'focus_time1';
  bool isPlaying = false;
  // DateTime differenceInDays = currentTime.difference(focustime).inMinutes;

  TimeProvider() {
    focustime = 25.00;
    remainingTime = focustime;
  }

  double updateCounter() {
    remainingTime -= 1;
    notifyListeners();

    return remainingTime;
  }

  void start() {
    remainingTime = focustime;
    isPlaying = true;
  }

  void pause() {
    isPlaying = false;
  }

  void timesUp(ctx) {
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

    Locally locally = Locally(
      context: ctx,
      payload: 'FOYG',
      pageRoute: MaterialPageRoute(builder: (context) => CountingScreen()),
      appIcon: 'mipmap/ic_launcher',
    );

    locally.show(title: "Times Up", message: "Congratulations 🎉🎊");

    notifyListeners();
  }
}
