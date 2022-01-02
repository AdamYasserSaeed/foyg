import 'package:flutter/material.dart';

class NavigationFunctions {
  ///Navigator.push
  static void navPush(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  ///Navigator.pushReplacement
  static void navReplacement(context, widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  ///Navigator.pushNamed
  static void navNamed(context, String widgetName) {
    Navigator.pushNamed(context, widgetName);
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}
