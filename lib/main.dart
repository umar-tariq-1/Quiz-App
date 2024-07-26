import 'package:flutter/material.dart';
import 'dart:math';
import './question.dart';
import './button.dart';
import './Timer.dart';

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
  var currentQuestionIndex = 0;
  var currentWidgets = "Start Quiz";
  List questionIndexes = [];
  var questions = {
    "What is your name?": ["Umar", "Bilal", "Usman", "Abubakar"],
    "What is your age?": ["21", "20", "19", "22"],
    "What are you studying?": [
      "Computer Science",
      "Electrical Engineering",
      "Data Science",
      "Mechanical Engineering"
    ]
  };
  var score = 0;

  List<int> getRandomNumbers(int m, int n) {
    List<int> numbers = [];
    for (int i = m; i <= n; i++) {
      numbers.add(i);
    }
    Random random = Random();
    numbers.shuffle(random);
    Random random2 = Random();
    numbers.shuffle(random2);
    return numbers;
  }

  void optionSelected(String selectedOption) {
    setState(() {
      if (selectedOption ==
          questions.values.toList()[questionIndexes[currentQuestionIndex]][0]) {
        score++;
      }
      if (currentQuestionIndex != questions.keys.toList().length - 1) {
        currentQuestionIndex = currentQuestionIndex + 1;
      } else {
        currentQuestionIndex = 0;
        currentWidgets = "Show Score";
        // End of quiz logic here
      }
    });
  }

  void reset(String reset) {
    score = 0;
    setState(() {
      currentQuestionIndex = 0;
      currentWidgets = "Show Questions";
    });
  }

  void timeUp() {
    setState(() {
      currentQuestionIndex = 0;
      currentWidgets = "Show Score";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex == 0) {
      questionIndexes = getRandomNumbers(0, questions.length - 1);
    }
    List optionIndexes = getRandomNumbers(0, 3);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Quiz App")),
            backgroundColor: const Color.fromARGB(255, 10, 10, 10),
            foregroundColor: const Color.fromARGB(255, 239, 239, 239),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (currentWidgets == "Show Questions")
                ? [
                    Question(
                        currentQuestionIndex + 1,
                        questions.keys
                            .toList()[questionIndexes[currentQuestionIndex]]),
                    ...optionIndexes.map((index) {
                      return Button(
                          questions.values.toList()[
                              questionIndexes[currentQuestionIndex]][index],
                          optionSelected);
                    }),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: TimerWidget(
                        durationInSeconds: 10,
                        onTimerComplete: () => timeUp(),
                      ),
                    )
                  ]
                : (currentWidgets == "Show Score")
                    ? [
                        Question(0, "You scored $score/${questions.length}"),
                        Button(
                          "Restart Quiz",
                          reset,
                          fontSize: 21,
                          height: 2.4,
                          width: 240,
                        )
                      ]
                    : [
                        Button(
                          "Start Quiz",
                          reset,
                          fontSize: 21,
                          height: 2.4,
                          width: 240,
                        )
                      ],
          ))),
    );
  }
}
