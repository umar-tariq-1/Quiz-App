import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final bool transitionColor;
  final bool border;
  final void Function() onClick;

  const CustomOutlinedButton(
      {super.key,
      required this.buttonText,
      this.fontSize = 17.125,
      this.border = true,
      this.transitionColor = true,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10.5, horizontal: 30)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        side: WidgetStateProperty.resolveWith<BorderSide?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return const BorderSide(color: Colors.transparent);
            }
            return BorderSide(
                color: border
                    ? Theme.of(context).primaryColor
                    : Colors.transparent);
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return transitionColor
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).primaryColor;
            }
            return Theme.of(context).primaryColor;
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return transitionColor
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.secondary;
            }
            return Theme.of(context)
                .colorScheme
                .secondary; // Use the default background color
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return Theme.of(context).primaryColor.withOpacity(0.04);
            }
            if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return Theme.of(context).primaryColor.withOpacity(0.12);
            }
            return Theme.of(context)
                .primaryColor; // Defer to the widget's default.
          },
        ),
      ),
      onPressed: () {},
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        softWrap: true,
      ),
    );
  }
}
