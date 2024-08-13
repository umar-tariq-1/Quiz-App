import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/widgets/base/navigation_drawer.dart';
import 'package:quiz_app/widgets/compound/add_question_form.dart';

class EditQuiz extends StatefulWidget {
  const EditQuiz({super.key});

  static const routePath = '/edit-quiz';

  @override
  State<EditQuiz> createState() => _EditQuizState();
}

class _EditQuizState extends State<EditQuiz> {
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
        body: AddQuestionForm(onSubmit: (_) {}));
  }
}
