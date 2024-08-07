import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/widgets/base/navigation_drawer.dart';
import 'package:quiz_app/widgets/pages/attempt_quiz.dart';
import 'package:quiz_app/widgets/pages/edit_quiz.dart';
import 'package:quiz_app/widgets/pages/new_quiz.dart';

Color statusBarColor = const Color.fromARGB(255, 10, 10, 10);
Color appBarColor = const Color.fromARGB(255, 10, 10, 10);
Color appBarTextColor = const Color.fromARGB(255, 239, 239, 239);
Color backgroundColor = const Color.fromARGB(255, 239, 239, 239);
Color primaryColor = const Color.fromARGB(255, 10, 10, 10);
Color secondaryColor = const Color.fromARGB(255, 239, 239, 239);

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
        focusColor: Colors.white,
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: statusBarColor,
          ),
        ),
      ),
      home: Scaffold(
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
                  title: const Text(
                    "Quiz App",
                    style: TextStyle(
                      fontFamily: 'BeautifulPeople',
                      fontSize: 25,
                      letterSpacing: 0.6,
                      wordSpacing: 0.6,
                    ),
                  ),
                  backgroundColor: appBarColor,
                  foregroundColor: appBarTextColor,
                ))),
        drawer: CustomNavigationDrawer(
          active: currentPage,
          changePage: _changePage,
        ),
        backgroundColor: backgroundColor,
        body: Container(),
      ),
    );
  }
}
