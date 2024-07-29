import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Question extends StatelessWidget {
  final int questionNumber;
  final String questionText;

  const Question(this.questionNumber, this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(/* top: 50, */ bottom: 22, left: 5, right: 5),
        child: Text(
          '${(questionNumber == 0) ? '' : '$questionNumber. '}$questionText',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
