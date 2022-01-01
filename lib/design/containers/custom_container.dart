import 'package:flutter/material.dart';
import 'package:foyg/design/buttons/custom_button.dart';
import 'package:foyg/design/titles/title.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final BoxBorder? border;
  final bool? isParent;
  final Widget? child;
  final String? text;

  const CustomContainer({
    Key? key,
    this.radius,
    this.color,
    this.border,
    this.isParent,
    this.height,
    this.width,
    this.child,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 15),
        color: color ?? const Color(0xff5C8FAC),
        border: border,
      ),
      child: (isParent == true)
          ? child
          : Center(
              child: Text(
                text ?? "demo data",
                style: GoogleFonts.farro(color: Colors.white),
              ),
            ),
    );
  }
}

class CustomContainerWithButton extends StatelessWidget {
  final double? height;
  final double? buttonheight;
  final double? width;
  final double? buttonwidth;
  final double? radius;
  final Color? color;
  final BoxBorder? border;
  final bool? isParent;
  final Widget? child;
  final String? text;
  final String? buttontext;
  final VoidCallback? onTap;

  const CustomContainerWithButton({
    Key? key,
    this.radius,
    this.color,
    this.border,
    this.isParent,
    this.height,
    this.width,
    this.child,
    this.text,
    this.buttontext,
    this.onTap,
    this.buttonheight,
    this.buttonwidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 15),
        color: color ?? const Color(0xff5C8FAC),
        border: border,
      ),
      child: CustomContainer(
        isParent: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTitle(
              title: text,
              titleSize: MediaQuery.of(context).size.height / 40,
            ),
            CustomButton(
              height: buttonheight,
              width: buttonwidth,
              onTap: onTap,
              isParent: true,
              child: Center(
                child: Text(
                  buttontext!,
                  style: GoogleFonts.farro(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 40,
                  ),
                ),
              ),
              color: const Color(0xffffffff),
            ),
          ],
        ),
      ),
    );
  }
}
