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

  Button({
    super.key,
    required this.buttonText,
    required this.onClick,
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
              color:
                  active ? Theme.of(context).primaryColor : Colors.transparent,
              width: 2)),
      width: width,
      padding: const EdgeInsets.all(1.75),
      child: ElevatedButton(
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).colorScheme.secondary,
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
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1),
                    ),
                  ],
                )),
    );
  }
}
