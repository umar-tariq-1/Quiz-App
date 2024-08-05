import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/base/navigation_drawer.dart';
import 'package:quiz_app/widgets/pages/attempt_quiz.dart';
import 'package:quiz_app/widgets/pages/edit_quiz.dart';
import 'package:quiz_app/widgets/pages/new_quiz.dart';

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
  String currentPage = "Home Page";

  void _changePage(String page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/new-quiz': (context) => const NewQuiz(),
        '/attempt-quiz': (context) =>
            AttemptQuiz(mainContext: context, changePage: _changePage),
        '/edit-quiz': (context) => const EditQuiz(),
      },
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
        drawer: CustomNavigationDrawer(
          active: currentPage,
          changePage: _changePage,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(),
      ),
    );
  }
}
