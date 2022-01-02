import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFiled extends StatelessWidget {
  final String? title;
  final bool? isPassword;
  final bool? isNumber;
  final int? length;
  final TextEditingController? textController;
  final int? lines;
  final Color? fillColor;
  final VoidCallback? iconOnTap;
  final Function(String)? onChanged;
  final Widget? icon;

  const CustomTextFiled({
    Key? key,
    this.title,
    this.isNumber,
    this.isPassword,
    this.length,
    this.lines,
    this.textController,
    this.fillColor,
    this.icon,
    this.iconOnTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Text(
            title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 7,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextFormField(
              onChanged: onChanged,
              controller: textController,
              obscureText: isPassword ?? false,
              keyboardType:
                  isNumber ?? false ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                counterText: '',
                suffix: GestureDetector(
                  onTap: iconOnTap,
                  child: icon ?? const Icon(Icons.lock),
                ),
                border: InputBorder.none,
                fillColor: fillColor ?? const Color(0xFF9B9898),
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
