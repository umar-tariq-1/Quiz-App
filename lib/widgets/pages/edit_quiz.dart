import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/widgets/base/navigation_drawer.dart';
import 'package:quiz_app/widgets/compound/custom_form.dart';

class EditQuiz extends StatefulWidget {
  const EditQuiz({super.key});

  static const routePath = '/edit-quiz';

  @override
  State<EditQuiz> createState() => _EditQuizState();
}

class _EditQuizState extends State<EditQuiz> {
  void _formSubmitted(data) {
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(68),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3.5),
                  ),
                ]),
                child: AppBar(
                  toolbarHeight: 68,
                  centerTitle: true,
                  title: const Text(
                    "Edit Quiz",
                    style: TextStyle(
                      fontFamily: 'BeautifulPeople',
                      fontSize: 25.25,
                      letterSpacing: 1.3,
                      wordSpacing: 1.2,
                    ),
                  ),
                  leading: Builder(
                    builder: (context) {
                      return Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: IconButton(
                            icon: const Icon(Icons.menu),
                            color: appBarTextColor,
                            iconSize: 29,
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ));
                    },
                  ),
                  backgroundColor: appBarColor,
                  foregroundColor: appBarTextColor,
                ))),
        backgroundColor: backgroundColor,
        drawer: const CustomNavigationDrawer(
          active: "Edit Quiz",
        ),
        body: CustomForm(
          onSubmit: _formSubmitted,
          inputFieldsList: [
            {
              "label": "Question",
              "controllerId": "question",
              "color": Theme.of(context).primaryColor,
            },
            {
              "label": "Answer",
              "controllerId": "answer",
              "color": Colors.green.shade800,
            },
            {
              "label": "Option 1",
              "controllerId": "option1",
              "color": Colors.red.shade800,
            },
            {
              "label": "Option 2",
              "controllerId": "option2",
              "color": Colors.red.shade800,
            },
            {
              "label": "Option 3",
              "controllerId": "option3",
              "color": Colors.red.shade800,
            },
          ],
        )
        /* Button(
          buttonText: 'Edit Quiz',
          active: true,
          onClick: (_) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return (AddQuestionForm(
                  onSubmit: (data) {
                    print(data);
                  },
                  inputFieldsList: [
                    {
                      "label": "Question",
                      "controllerId": "question",
                      "color": Theme.of(context).primaryColor,
                    },
                    {
                      "label": "Answer",
                      "controllerId": "answer",
                      "color": Colors.green.shade800,
                    },
                    {
                      "label": "Option 1",
                      "controllerId": "option1",
                      "color": Colors.red.shade800,
                    },
                    {
                      "label": "Option 2",
                      "controllerId": "option2",
                      "color": Colors.red.shade800,
                    },
                    {
                      "label": "Option 3",
                      "controllerId": "option3",
                      "color": Colors.red.shade800,
                    },
                    {
                      "label": "Option 4",
                      "controllerId": "option4",
                      "color": Colors.red.shade800,
                    },
                  ],
                ));
              },
            );
          },
        ) */
        );
  }
}
