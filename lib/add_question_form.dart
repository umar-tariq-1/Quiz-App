// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'input_field.dart';
import './button.dart';

class AddQuestionForm extends StatelessWidget {
  final Map<String, TextEditingController> controllers = {
    "question": TextEditingController(),
    "answer": TextEditingController(),
    "option1": TextEditingController(),
    "option2": TextEditingController(),
    "option3": TextEditingController()
  };
  Map questionData = {};

  void clearControllers(List<String> namesList) {
    for (var name in namesList) {
      if (controllers.containsKey(name)) {
        controllers[name]!.clear();
      }
    }
  }

  AddQuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomInputField(
        controller: controllers['question']!,
        label: 'Question',
      ),
      CustomInputField(
        controller: controllers['answer']!,
        label: 'Answer',
        color: Colors.green.shade800,
      ),
      CustomInputField(
          controller: controllers['option1']!,
          label: 'Option 1',
          color: Colors.red.shade800),
      CustomInputField(
          controller: controllers['option2']!,
          label: 'Option 2',
          color: Colors.red.shade800),
      CustomInputField(
          controller: controllers['option3']!,
          label: 'Option 3',
          color: Colors.red.shade800),
      Button(
        "Submit",
        (_) {
          clearControllers([
            'question',
            'answer',
            'option1',
            'option2',
            'option3',
          ]);
        },
        fontSize: 20,
        height: 2.3,
        width: 235,
        active: true,
      ),
    ]);
  }
}
