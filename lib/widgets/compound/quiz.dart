// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:quiz_app/widgets/base/button.dart';
import 'package:quiz_app/widgets/base/question.dart';
import 'package:quiz_app/widgets/base/next_button.dart';
import 'package:quiz_app/widgets/base/timer.dart';
import 'package:quiz_app/widgets/base/loader.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';

class Quiz extends StatefulWidget {
  final void Function(dynamic) mainPage;

  const Quiz({super.key, required this.mainPage});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int activeButton = -1;
  List<int> questionIndexes = [];
  List<int> optionIndexes = [];
  Map<String, List<dynamic>> questions = {};
  int score = 0;
  String currentState = "Show Questions";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  Future<void> _fetchQuestions() async {
    setState(() {
      isLoading = true;
    });

    var url =
        'https://opentdb.com/api.php?amount=5&category=21&difficulty=easy&type=multiple';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      setState(() {
        questions = {};
        for (var i = 0; i < data['results'].length; i++) {
          String question = data['results'][i]['question'];
          question = question.replaceAll('&#039;', "'");
          question = question.replaceAll('&amp;', "&");
          question = question.replaceAll('&quot;', '"');
          List<dynamic> options = data['results'][i]['incorrect_answers'];
          options.insert(0, data['results'][i]['correct_answer']);
          for (var j = 0; j < 4; j++) {
            options[j] = options[j].toString().replaceAll('&#039;', "'");
            options[j] = options[j].toString().replaceAll('&amp;', "&");
            options[j] = options[j].toString().replaceAll('&quot;', '"');
          }
          questions[question] = options;
        }
        questionIndexes = _getRandomNumbers(0, questions.length - 1);
        optionIndexes = _getRandomNumbers(0, 3);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load questions');
    }
  }

  List<int> _getRandomNumbers(int m, int n) {
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

  void _optionSelected(String selectedOption) {
    setState(() {
      activeButton = questions.values
          .toList()[questionIndexes[currentQuestionIndex]]
          .indexOf(selectedOption);
    });
  }

  void _nextQuestion() {
    if (activeButton != -1) {
      if (questions.values.toList()[questionIndexes[currentQuestionIndex]]
              [activeButton] ==
          questions.values.toList()[questionIndexes[currentQuestionIndex]][0]) {
        score++;
      }
    }
    setState(() {
      if (currentQuestionIndex != questions.keys.toList().length - 1) {
        currentQuestionIndex++;
        optionIndexes = _getRandomNumbers(0, 3);
        activeButton = -1;
      } else {
        setState(() {
          currentState = "Show Score";
          currentQuestionIndex = 0;
          activeButton = -1;
        });
      }
    });
  }

  void _handleAppLostFocus(FGBGType state) {
    if (state == FGBGType.background) {
      print('cheating');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FGBGNotifier(
        onEvent: _handleAppLostFocus,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 68,
              centerTitle: true,
              // leading: IconButton(
              //   icon: const Icon(null),
              //   iconSize: 29,
              //   onPressed: () {
              //     // Scaffold.of(context).openDrawer();
              //   },
              // ),
              title: const Text(
                "Attempt Quiz",
                style: TextStyle(
                  fontFamily: 'BeautifulPeople',
                  fontSize: 25,
                  letterSpacing: 1,
                  wordSpacing: 1,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 10, 10, 10),
              foregroundColor: const Color.fromARGB(255, 239, 239, 239),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (currentState == "Show Questions")
                          Center(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (questions.isNotEmpty)
                                    Question(
                                      currentQuestionIndex + 1,
                                      questions.keys.toList()[questionIndexes[
                                          currentQuestionIndex]],
                                    ),
                                  ...optionIndexes.map((index) {
                                    if (questions.isNotEmpty) {
                                      return Button(
                                        questions.values.toList()[
                                            questionIndexes[
                                                currentQuestionIndex]][index],
                                        (option) => _optionSelected(option),
                                        active: index == activeButton,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                                  if (questions.isNotEmpty)
                                    Nextbtn(_nextQuestion,
                                        disabled: activeButton == -1),
                                  if (questions.isNotEmpty)
                                    TimerWidget(
                                      durationInSeconds: 1000,
                                      onTimerComplete: () => setState(() {
                                        currentState = 'Show Score';
                                      }),
                                    ),
                                ],
                              ),
                            ),
                          )
                        else if (currentState == "Show Score")
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Question(
                                  0, "You scored $score/${questions.length}"),
                              Button(
                                "Main Page",
                                widget.mainPage,
                                fontSize: 18.6,
                                height: 13,
                                width: 220,
                                leadingIcon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color.fromARGB(255, 239, 239, 239),
                                ),
                                active: true,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                if (isLoading) Center(child: Loader(isLoading: isLoading)),
              ],
            )));
  }
}
