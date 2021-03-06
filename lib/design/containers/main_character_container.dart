import 'package:flutter/material.dart';

class CharecterContainer extends StatelessWidget {
  ///the type of the character
  ///Like wave,hero...
  ///You Can Use This :
  /// 1- celebration
  ///
  /// 2- focus_time1
  ///
  /// 3- focus_time2
  ///
  /// 4- focus_time3
  ///
  /// 5- hero
  ///
  /// 6- take_break
  ///
  /// 7- wave
  ///
  /// 8- think
  final String type;
  final double height;

  const CharecterContainer({Key? key, required this.type, this.height = 400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("img/$type.png"),
    );
  }
}
