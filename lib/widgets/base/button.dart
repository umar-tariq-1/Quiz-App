// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final double height;
  final double width;
  bool disabled;
  bool active;
  final Icon? leadingIcon;
  final void Function(dynamic) onClick;

  Button(
    this.buttonText,
    this.onClick, {
    super.key,
    this.fontSize = 18.25,
    this.height = 12.75,
    this.width = 245,
    this.active = false,
    this.disabled = false,
    this.leadingIcon,
  });

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
      padding: const EdgeInsets.all(1.75),
      child: ElevatedButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 10, 10, 10),
              padding:
                  EdgeInsets.symmetric(horizontal: 18.885, vertical: height)),
          onPressed: disabled
              ? null
              : () {
                  onClick(buttonText);
                },
          child: leadingIcon == null
              ? Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 239, 239, 239),
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 11.0),
                      child: leadingIcon,
                    ),
                    Text(
                      buttonText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 239, 239, 239),
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1),
                    ),
                  ],
                )),
    );
  }
}
