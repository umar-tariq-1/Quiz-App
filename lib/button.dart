import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final double height;
  final double width;
  final void Function(String) onClick;

  const Button(this.buttonText, this.onClick,
      {super.key, this.fontSize = 19, this.height = 2.3, this.width = 260});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(top: 3, bottom: 6),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 10, 10, 10),
            side: const BorderSide(
              color: Color.fromARGB(255, 150, 150, 150),
              width: 2,
            ),
            padding: const EdgeInsets.all(3)),
        onPressed: () => onClick(buttonText),
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
