import 'package:flutter/material.dart';

class FlotingButton extends StatelessWidget {
  final Widget? child;
  final String? tooltip;
  final VoidCallback? onPress;
  final IconData? iconData;
  final isParent = false;

  const FlotingButton(
      {Key? key, this.child, this.onPress, this.iconData, this.tooltip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      tooltip: tooltip,
      child: (isParent == true) ? child : Icon(iconData),
      backgroundColor: const Color(0xff5C8FAC),
    );
  }
}
