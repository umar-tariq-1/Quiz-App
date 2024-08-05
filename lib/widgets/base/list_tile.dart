import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final bool active;
  final String text;
  final IconData iconData;
  final VoidCallback onTap;
  final double iconSize;

  const CustomListTile(
      {super.key,
      required this.active,
      required this.text,
      required this.iconData,
      required this.onTap,
      this.iconSize = 26});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: active
          ? const BoxDecoration(
              color: Color.fromARGB(255, 10, 10, 10),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(9999),
                bottomRight: Radius.circular(9999),
              ),
            )
          : null,
      child: ListTile(
        leading: Icon(
          iconData,
          color: active
              ? const Color.fromARGB(255, 239, 239, 239)
              : const Color.fromARGB(255, 10, 10, 10),
          size: iconSize,
        ),
        title: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'RalewayLight',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: active
                    ? const Color.fromARGB(255, 239, 239, 239)
                    : const Color.fromARGB(255, 10, 10, 10),
              ),
            )),
        onTap: onTap,
      ),
    );
  }
}
