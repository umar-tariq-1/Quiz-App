import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/base/navigation_drawer.dart';
import 'package:quiz_app/widgets/compound/add_question_form.dart';

class NewQuiz extends StatefulWidget {
  const NewQuiz({super.key});

  @override
  State<NewQuiz> createState() => _NewQuizState();
}

class _NewQuizState extends State<NewQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 68,
          centerTitle: true,
          title: const Text(
            "New Quiz",
            style: TextStyle(
              fontFamily: 'BeautifulPeople',
              fontSize: 25,
              letterSpacing: 1.3,
              wordSpacing: 1.2,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 10, 10, 10),
          foregroundColor: const Color.fromARGB(255, 239, 239, 239),
          leading: Builder(
            builder: (context) {
              return Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 29,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ));
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        drawer: CustomNavigationDrawer(
          active: "New Quiz",
        ),
        body: AddQuestionForm(onSubmit: (_) {}));
  }
}
