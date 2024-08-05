// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/base/list_tile.dart';
import 'package:quiz_app/widgets/compound/add_question_form.dart';
import 'package:quiz_app/widgets/compound/quiz.dart';

class CustomNavigationDrawer extends StatelessWidget {
  String active;
  final void Function(String) changePage;
  CustomNavigationDrawer(
      {super.key,
      this.active = "Main Page",
      this.changePage = _defaultChangePage});

  static void _defaultChangePage(String page) {}

  @override
  Widget build(BuildContext context) => SizedBox(
      width: 250,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context, active, changePage)
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

Widget buildMenuItems(BuildContext context, active, changePage) => Column(
      children: [
        CustomListTile(
            active: active == "New Quiz",
            text: "New Quiz",
            iconData: Icons.add_comment_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quiz(
                        mainContext: context,
                        changePage: changePage,
                      )));
              changePage("New Quiz");
            }),
        CustomListTile(
            active: active == "Attempt Quiz",
            text: "Attempt Quiz",
            iconData: Icons.content_paste_go_sharp,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quiz(
                        mainContext: context,
                        changePage: changePage,
                      )));
              changePage("Attempt Quiz");
            }),
        CustomListTile(
            active: active == "Edit Quiz",
            text: "Edit Quiz",
            iconData: Icons.edit_calendar_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddQuestionForm(onSubmit: (_) {})));
              changePage("Edit Quiz");
            }),
        const Divider(
          color: Color.fromARGB(255, 10, 10, 10),
        ),
        CustomListTile(
            active: active == "Home Page",
            text: "Home Page",
            iconData: Icons.home_outlined,
            iconSize: 27.5,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Quiz(
                        mainContext: context,
                        changePage: changePage,
                      )));
              changePage("Home Page");
            }),
      ],
    );
