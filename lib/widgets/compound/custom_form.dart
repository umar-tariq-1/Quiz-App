// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/base/custom_outlined_button.dart';
import '../base/input_field.dart';
import '../base/custom_elevated_button.dart';

class CustomForm extends StatelessWidget {
  final Map<String, TextEditingController> controllers = {};
  final void Function(dynamic) onSubmit;
  List<Map<String, dynamic>> inputFieldsList = [];
  final List<Widget> inputFields = [];

  void clearControllers(List<String> namesList) {
    for (var name in namesList) {
      if (controllers.containsKey(name)) {
        controllers[name]!.clear();
      }
    }
  }

  void _submitClicked() {
    Map data = {};
    for (var i = 0; i < inputFieldsList.length; i++) {
      data[inputFieldsList[i]['controllerId']!] =
          controllers[inputFieldsList[i]['controllerId']!]!.text.trim();
    }
    onSubmit(data);
    clearControllers([
      for (var i = 0; i < inputFieldsList.length; i++)
        inputFieldsList[i]['controllerId']!
    ]);
  }

  CustomForm(
      {super.key, required this.onSubmit, required this.inputFieldsList}) {
    for (var i = 0; i < inputFieldsList.length; i++) {
      controllers[inputFieldsList[i]['controllerId']] = TextEditingController();
      inputFields.add(CustomInputField(
        controller: controllers[inputFieldsList[i]['controllerId']]!,
        label: inputFieldsList[i]['label'],
        color: inputFieldsList[i]['color'],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...inputFields,
      const SizedBox(
        height: 15,
      ),
      Row(
        children: [
          CustomOutlinedButton(
            buttonText: "Submit",
            onClick: _submitClicked,
          )
        ],
      ),
      CustomElevatedButton(
        buttonText: "Submit",
        onClick: (_) {
          Map data = {};
          for (var i = 0; i < inputFieldsList.length; i++) {
            data[inputFieldsList[i]['controllerId']!] =
                controllers[inputFieldsList[i]['controllerId']!]!.text.trim();
          }
          onSubmit(data);
          clearControllers([
            for (var i = 0; i < inputFieldsList.length; i++)
              inputFieldsList[i]['controllerId']!
          ]);
        },
        fontSize: 18.6,
        height: 13,
        minWidth: 220,
        active: true,
        leadingIcon: const Icon(
          Icons.add_task_rounded,
          size: 25,
        ),
      ),
    ]);
  }
}
