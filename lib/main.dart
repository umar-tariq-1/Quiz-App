import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/compound/add_question_form.dart';
import 'package:quiz_app/widgets/compound/quiz.dart';
import 'widgets/base/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String currentPage = "Main Page";

  void _showQuiz(_) {
    setState(() {
      currentPage = "Show Questions";
    });
  }

  void _showAddQuestions(_) {
    setState(() {
      currentPage = "Add Questions";
    });
  }

  void _showMainPage(_) {
    setState(() {
      currentPage = "Main Page";
    });
  }

  void _handleQuestionSubmitted(questionData) {
    print(questionData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        focusColor: const Color.fromARGB(255, 239, 239, 239),
        primaryColor: const Color.fromARGB(255, 10, 10, 10),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromARGB(255, 239, 239, 239),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 68,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 29,
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            },
          ),
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontFamily: 'BeautifulPeople',
              fontSize: 25,
              letterSpacing: 0.6,
              wordSpacing: 0.6,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 10, 10, 10),
          foregroundColor: const Color.fromARGB(255, 239, 239, 239),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: currentPage == "Show Questions"
              ? Quiz(
                  mainPage: (_) => setState(() {
                        currentPage = "Main Page";
                      }))
              : currentPage == "Main Page"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          "Attempt Quiz",
                          _showQuiz,
                          fontSize: 18.6,
                          height: 13,
                          width: 220,
                          active: true,
                        ),
                        Button(
                          "Add Questions",
                          _showAddQuestions,
                          fontSize: 18.6,
                          height: 13,
                          width: 220,
                          active: true,
                        ),
                      ],
                    )
                  : currentPage == "Add Questions"
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AddQuestionForm(_handleQuestionSubmitted),
                            Button(
                              "Main Page",
                              _showMainPage,
                              fontSize: 18.6,
                              height: 13,
                              width: 220,
                              active: true,
                            ),
                          ],
                        )
                      : Container(),
        ),
      ),
    );
  }
}
