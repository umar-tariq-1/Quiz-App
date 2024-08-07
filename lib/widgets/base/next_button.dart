import 'package:flutter/material.dart';

class Nextbtn extends StatelessWidget {
  final bool disabled;
  final void Function() onClick;

  const Nextbtn({super.key, required this.onClick, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45, bottom: 40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3.5),
          ),
        ],
        color: disabled
            ? const Color.fromARGB(255, 208, 208, 208)
            : Theme.of(context).primaryColor,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: disabled ? null : onClick,
        color: disabled
            ? const Color.fromARGB(255, 148, 148, 148)
            : Theme.of(context).colorScheme.secondary,
        iconSize: 26,
        padding: const EdgeInsets.all(13),
      ),
    );
  }
}
