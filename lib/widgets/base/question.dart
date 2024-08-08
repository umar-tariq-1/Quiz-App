import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final int questionNumber;
  final String questionText;

  const Question(
      {super.key, this.questionNumber = 0, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
        child: Text(
          '${(questionNumber == 0) ? '' : '$questionNumber.  '}$questionText',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'RalewaySemiBold',
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              letterSpacing: 0),
        ));
  }
}
