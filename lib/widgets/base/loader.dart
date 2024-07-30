// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  bool isLoading;

  Loader({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        if (isLoading)
          const Opacity(
            opacity: 0.9,
            child: ModalBarrier(
                dismissible: false, color: Color.fromARGB(255, 239, 239, 239)),
          ),
        if (isLoading)
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.threeArchedCircle(
                color: const Color.fromARGB(255, 10, 10, 10),
                size: 58,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(left: 4),
                child: const Text("Loading...",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ),
            ],
          )),
      ],
    );
  }
}
