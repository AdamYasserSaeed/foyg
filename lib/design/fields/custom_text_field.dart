import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFiled extends StatelessWidget {
  final String? title;
  final bool? isPassword;
  final bool? isNumber;
  final int? length;
  final TextEditingController? textController;
  final int? lines;

  const CustomTextFiled({
    Key? key,
    this.title,
    this.isNumber,
    this.isPassword,
    this.length,
    this.lines,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              controller: textController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(length),
              ],
              obscureText: isPassword ?? false,
              keyboardType:
                  isNumber ?? false ? TextInputType.number : TextInputType.text,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
