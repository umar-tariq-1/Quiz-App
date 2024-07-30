import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final bool password;
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final Color color;

  const CustomInputField({
    super.key,
    this.password = false,
    this.label = '',
    this.placeholder = '',
    required this.controller,
    this.color = const Color.fromARGB(255, 10, 10, 10),
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: color,
          selectionColor: color.withOpacity(0.5),
          selectionHandleColor: color,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.5, horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: TextField(
            cursorColor: color,
            obscureText: password,
            cursorWidth: 1.2,
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: color),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color, width: 2),
              ),
              hintText: placeholder,
              labelText: label,
              labelStyle: TextStyle(
                color: color,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
