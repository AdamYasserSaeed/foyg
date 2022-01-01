import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double minTime;
  final double maxTime;
  final Function(double?)? onUpdate;

  const CustomSlider({
    Key? key,
    this.value = 20,
    this.minTime = 10,
    this.maxTime = 60,
    this.onUpdate,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: widget.minTime,
      max: widget.maxTime,
      value: widget.value,
      activeColor: const Color(0xff5C8FAC),
      onChanged: widget.onUpdate,
    );
  }
}
