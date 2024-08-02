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

  void changePage(String page) {
    setState(() {
      currentPage = page;
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
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   iconSize: 29,
          //   onPressed: () {
          //     // Scaffold.of(context).openDrawer();
          //   },
          // ),
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
        drawer: const NavigationDrawer(),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: currentPage == "Attempt Quiz"
              ? Quiz(mainPage: (_) => changePage("Main Page"))
              : currentPage == "Main Page"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          "Attempt Quiz",
                          (_) => changePage("Attempt Quiz"),
                          fontSize: 18.6,
                          height: 13,
                          width: 220,
                          active: true,
                          leadingIcon: const Icon(
                            Icons.content_paste_go_rounded,
                            color: Color.fromARGB(255, 239, 239, 239),
                          ),
                        ),
                        Button(
                          "Add Questions",
                          (_) => changePage("Add Questions"),
                          fontSize: 18.6,
                          height: 13,
                          width: 220,
                          active: true,
                          leadingIcon: const Icon(
                            Icons.add_comment_rounded,
                            color: Color.fromARGB(255, 239, 239, 239),
                          ),
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
                              (_) => changePage("Main Page"),
                              fontSize: 18.6,
                              height: 13,
                              width: 220,
                              active: true,
                              leadingIcon: const Icon(
                                Icons.arrow_back_rounded,
                                color: Color.fromARGB(255, 239, 239, 239),
                              ),
                            ),
                          ],
                        )
                      : Container(),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context)
              ]),
        ),
      );
}

Widget buildHeader(BuildContext context) => Container();
Widget buildMenuItems(BuildContext context) => Column(
      children: [
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("Add Question"),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Quiz(mainPage: (_) {})));
          },
        )
      ],
    );
