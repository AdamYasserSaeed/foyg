import 'package:flutter/material.dart';

class CharecterContainer extends StatelessWidget {
  ///the type of the character
  ///Like wave,hero...
  ///You Can Use This :
  /// 1- celebration
  ///
  /// 2- foucus_time1
  ///
  /// 3- foucus_time2
  ///
  /// 4- foucus_time3
  ///
  /// 5- hero
  ///
  /// 6- take_break
  ///
  /// 7- wave
  final String type;

  const CharecterContainer({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("img/$type.png"),
    );
  }
}
