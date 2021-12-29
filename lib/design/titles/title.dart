import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String? title;
  final double? titleSize;
  final Color? textColor;
  final TextAlign align;

  const CustomTitle({
    Key? key,
    this.title,
    this.align = TextAlign.left,
    this.textColor,
    this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "Hi , MY Name is Ludo\nI well be your friend\nI hop You Like it",
      textAlign: align,
      style: GoogleFonts.farro(
          fontSize: titleSize ?? 20, color: textColor ?? Colors.black),
    );
  }
}
