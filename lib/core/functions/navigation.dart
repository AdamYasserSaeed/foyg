import 'package:flutter/material.dart';

class NavigationFunctions {
  ///Navigator.push
  void navPush(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  ///Navigator.pushReplacement
  void navReplacement(context, widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  ///Navigator.pushNamed
  void navNamed(context, String widgetName) {
    Navigator.pushNamed(context, widgetName);
  }
}
