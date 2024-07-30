import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final double height;
  final double width;
  bool disabled;
  bool active;
  final void Function(String) onClick;

  Button(this.buttonText, this.onClick,
      {super.key,
      this.fontSize = 18.5,
      this.height = 2.2,
      this.width = 260,
      this.active = false,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(
              color: active
                  ? const Color.fromARGB(255, 10, 10, 10)
                  : const Color.fromARGB(0, 10, 10, 10),
              width: 2)),
      width: width,
      padding: const EdgeInsets.all(1.5),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 10, 10, 10),
            padding:
                const EdgeInsets.only(top: 3, bottom: 3, left: 15, right: 15)),
        onPressed: disabled ? null : () => onClick(buttonText),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromARGB(255, 239, 239, 239),
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            height: height,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}
