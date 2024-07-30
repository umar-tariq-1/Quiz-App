import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'input_field.dart';
import './question.dart';
import './button.dart';
import './timer.dart';
import 'next_button.dart';

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
  var currentWidgets = "Main Page";
  var activeButton = -1;
  List questionIndexes = [];
  List optionIndexes = getRandomNumbers(0, 3);
  Map<String, List<dynamic>> questions = {
    // "What is your name?": ["Umar", "Bilal", "Usman", "Abubakar"],
    // "What is your age?": ["21", "20", "19", "22"],
    // "What are you studying?": [
    //   "Computer Science",
    //   "Electrical Engineering",
    //   "Data Science",
    //   "Mechanical Engineering"
    // ]
  };
  var score = 0;
  bool isLoading = false;
  final Map<String, TextEditingController> controllers = {
    "question": TextEditingController(),
    "answer": TextEditingController(),
    "option1": TextEditingController(),
    "option2": TextEditingController(),
    "option3": TextEditingController()
  };

  Future<Map> httpGet(url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load questions');
    }
  }

  void clearControllers(List<String> namesList) {
    for (var name in namesList) {
      if (controllers.containsKey(name)) {
        controllers[name]!.clear();
      }
    }
  }

  void optionSelected(String selectedOption) {
    setState(() {
      activeButton = questions.values
          .toList()[questionIndexes[currentQuestionIndex]]
          .indexOf(selectedOption);
    });
  }

  void nextQuestion() {
    if (activeButton != -1) {
      if (questions.values.toList()[questionIndexes[currentQuestionIndex]]
              [activeButton] ==
          questions.values.toList()[questionIndexes[currentQuestionIndex]][0]) {
        score++;
      }
    }
    setState(() {
      if (currentQuestionIndex != questions.keys.toList().length - 1) {
        currentQuestionIndex = currentQuestionIndex + 1;
        optionIndexes = getRandomNumbers(0, 3);
        activeButton = -1;
      } else {
        currentQuestionIndex = 0;
        currentWidgets = "Show Score";
        activeButton = -1;
        // End of quiz logic here
      }
    });
  }

  void reset(String reset) async {
    setState(() {
      isLoading = true;
    });
    var data = await httpGet(
        'https://opentdb.com/api.php?amount=3&category=21&difficulty=easy&type=multiple');
    questions = {};
    for (var i = 0; i < data['results'].length; i++) {
      String question = data['results'][i]['question'];
      question = question.replaceAll('&#039;', "'");
      question = question.replaceAll('&amp;', "&");
      question = question.replaceAll('&quot;', '"');
      List<dynamic> options = data['results'][i]['incorrect_answers'];
      options.insert(0, data['results'][i]['correct_answer']);
      for (var i = 0; i < 4; i++) {
        options[i] = options[i].toString().replaceAll('&#039;', "'");
        options[i] = options[i].toString().replaceAll('&amp;', "&");
        options[i] = options[i].toString().replaceAll('&quot;', '"');
      }
      questions[question] = options;
    }
    setState(() {
      isLoading = false;
      currentQuestionIndex = 0;
      currentWidgets = "Show Questions";
      questionIndexes = getRandomNumbers(0, questions.length - 1);
      score = 0;
    });
  }

  void addQuestions(String question) {
    setState(() {
      currentWidgets = "Add Questions";
    });
  }

  void mainPage(String mainPage) {
    setState(() {
      currentWidgets = "Main Page";
    });
  }

  void timeUp() {
    setState(() {
      currentQuestionIndex = 0;
      currentWidgets = "Show Score";
    });
  }

  void submitQuestion(data) {
    clearControllers([
      'question',
      'answer',
      'option1',
      'option2',
      'option3',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Quiz App")),
            backgroundColor: const Color.fromARGB(255, 10, 10, 10),
            foregroundColor: const Color.fromARGB(255, 239, 239, 239),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: Stack(
            children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: (currentWidgets == "Show Questions")
                    ? [
                        Question(
                            currentQuestionIndex + 1,
                            questions.keys.toList()[
                                questionIndexes[currentQuestionIndex]]),
                        ...optionIndexes.map((index) {
                          return Button(
                            questions.values.toList()[
                                questionIndexes[currentQuestionIndex]][index],
                            optionSelected,
                            active: index == activeButton,
                          );
                        }),
                        Nextbtn(nextQuestion, disabled: activeButton == -1),
                        Container(
                          margin: const EdgeInsets.only(top: 0),
                          child: TimerWidget(
                            durationInSeconds: 1000,
                            onTimerComplete: () => timeUp(),
                          ),
                        )
                      ]
                    : (currentWidgets == "Show Score")
                        ? [
                            Question(
                                0, "You scored $score/${questions.length}"),
                            Button(
                              "Retake Quiz",
                              reset,
                              fontSize: 20,
                              height: 2.3,
                              width: 240,
                              active: true,
                            ),
                            Button(
                              "Main Page",
                              mainPage,
                              fontSize: 20,
                              height: 2.3,
                              width: 235,
                              active: true,
                            ),
                          ]
                        : (currentWidgets == "Main Page")
                            ? [
                                Button(
                                  "Attempt Quiz",
                                  reset,
                                  fontSize: 20,
                                  height: 2.3,
                                  width: 235,
                                  active: true,
                                ),
                                Button(
                                  "Add Questions",
                                  addQuestions,
                                  fontSize: 20,
                                  height: 2.3,
                                  width: 235,
                                  active: true,
                                ),
                              ]
                            : (currentWidgets == "Add Questions")
                                ? [
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
                                      submitQuestion,
                                      fontSize: 20,
                                      height: 2.3,
                                      width: 235,
                                      active: true,
                                    ),
                                    Button(
                                      "Main Page",
                                      mainPage,
                                      fontSize: 20,
                                      height: 2.3,
                                      width: 235,
                                      active: true,
                                    ),
                                  ]
                                : [],
              )),
              if (isLoading)
                const Opacity(
                  opacity: 0.9,
                  child: ModalBarrier(
                      dismissible: false,
                      color: Color.fromARGB(255, 239, 239, 239)),
                ),
              if (isLoading)
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.threeArchedCircle(
                      color: const Color.fromARGB(255, 10, 10, 10),
                      size: 58,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(left: 4),
                      child: const Text("Loading...",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                  ],
                )),
            ],
          )),
    );
  }
}

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
