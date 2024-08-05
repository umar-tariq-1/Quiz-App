import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/base/list_tile.dart';
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
  String currentPage = "Home Page";

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
        drawer: const NavigationDrawer(),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: currentPage == "Main Page"
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
                        Icons.content_paste_go_sharp,
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
  Widget build(BuildContext context) => SizedBox(
      width: 250,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context)
              ]),
        ),
      ));
}

Widget buildHeader(BuildContext context) => Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 30),
      margin: const EdgeInsets.only(bottom: 20),
      color: const Color.fromARGB(255, 5, 5, 5),
      height: 98,
      child: const Text(
        "Slide Menu",
        style: TextStyle(
          fontFamily: 'BeautifulPeople',
          color: Color.fromARGB(255, 239, 239, 239),
          fontSize: 24,
          letterSpacing: 1.3,
          wordSpacing: 1,
        ),
      ),
    );

Widget buildMenuItems(BuildContext context) => Column(
      children: [
        CustomListTile(
            active: false,
            text: "Attempt Quiz",
            iconData: Icons.content_paste_go_sharp,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quiz(mainContext: context)));
            }),
        CustomListTile(
            active: false,
            text: "New Quiz",
            iconData: Icons.add_comment_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quiz(mainContext: context)));
            }),
        CustomListTile(
            active: false,
            text: "Edit Quiz",
            iconData: Icons.edit_calendar_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quiz(mainContext: context)));
            }),
        const Divider(
          color: Color.fromARGB(255, 10, 10, 10),
        ),
        CustomListTile(
            active: true,
            text: "Home Page",
            iconData: Icons.home_outlined,
            iconSize: 27.5,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quiz(mainContext: context)));
            }),
      ],
    );
