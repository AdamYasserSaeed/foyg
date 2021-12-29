import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final BoxBorder? border;
  final bool? isParent;
  final Widget? child;
  final String? text;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    this.radius,
    this.color,
    this.border,
    this.isParent,
    this.height,
    this.width,
    this.child,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 15),
          color: color ?? const Color(0xff5C8FAC),
          border: border,
        ),
        child: (isParent == true)
            ? Center(child: child)
            : Center(
                child: Text(
                  text ?? "demo data",
                  style: GoogleFonts.farro(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
