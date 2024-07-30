import 'package:flutter/material.dart';

class Nextbtn extends StatelessWidget {
  final bool disabled;
  final void Function() onClick;

  const Nextbtn(this.onClick, {super.key, this.disabled = false});

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
            : const Color.fromARGB(255, 10, 10, 10),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: disabled ? null : onClick,
        color: disabled
            ? const Color.fromARGB(255, 148, 148, 148)
            : const Color.fromARGB(255, 239, 239, 239),
        iconSize: 26,
        padding: const EdgeInsets.all(13),
      ),
    );
  }
}
