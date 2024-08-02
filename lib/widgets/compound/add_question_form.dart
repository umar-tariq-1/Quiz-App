// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../base/input_field.dart';
import '../base/button.dart';

class AddQuestionForm extends StatelessWidget {
  final Map<String, TextEditingController> controllers = {
    "question": TextEditingController(),
    "answer": TextEditingController(),
    "option1": TextEditingController(),
    "option2": TextEditingController(),
    "option3": TextEditingController()
  };
  final void Function(dynamic) onSubmit;

  void clearControllers(List<String> namesList) {
    for (var name in namesList) {
      if (controllers.containsKey(name)) {
        controllers[name]!.clear();
      }
    }
  }

  AddQuestionForm(this.onSubmit, {super.key});

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
          onSubmit({
            'question': controllers['question']!.text,
            'answer': controllers['answer']!.text,
            'option1': controllers['option1']!.text,
            'option2': controllers['option2']!.text,
            'option3': controllers['option3']!.text
          });
          clearControllers([
            'question',
            'answer',
            'option1',
            'option2',
            'option3',
          ]);
        },
        fontSize: 18.6,
        height: 13,
        width: 220,
        active: true,
        leadingIcon: const Icon(
          Icons.playlist_add_check_circle_outlined,
          color: Color.fromARGB(255, 239, 239, 239),
          size: 25,
        ),
      ),
    ]);
  }
}
