// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/base/list_tile.dart';

class CustomNavigationDrawer extends StatelessWidget {
  String active;
  final void Function(String) changePage;
  CustomNavigationDrawer(
      {super.key, this.active = "", this.changePage = _defaultChangePage});

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

Widget buildHeader(BuildContext context) => Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: const Color.fromARGB(255, 10, 10, 10),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20),
          height: 68,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 5, 5, 5),
            border: const Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 239, 239, 239),
                width: 1,
              ),
              top: BorderSide(
                color: Color.fromARGB(255, 239, 239, 239),
                width: 1,
              ),
              right: BorderSide(
                color: Color.fromARGB(255, 239, 239, 239),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 7),
            child: const Text(
              "Slide Menu",
              style: TextStyle(
                fontFamily: 'BeautifulPeople',
                color: Color.fromARGB(255, 239, 239, 239),
                fontSize: 23.5,
                letterSpacing: 1.3,
                wordSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );

Widget buildMenuItems(BuildContext context, active, changePage) => Column(
      children: [
        CustomListTile(
            active: active == "New Quiz",
            text: "New Quiz",
            iconData: Icons.add_comment_outlined,
            onTap: () {
              Navigator.of(context).popAndPushNamed('/new-quiz');
            }),
        CustomListTile(
            active: active == "Attempt Quiz",
            text: "Attempt Quiz",
            iconData: Icons.content_paste_go_sharp,
            onTap: () {
              Navigator.of(context).popAndPushNamed("/attempt-quiz");
              changePage("Attempt Quiz");
            }),
        CustomListTile(
            active: active == "Edit Quiz",
            text: "Edit Quiz",
            iconData: Icons.edit_calendar_outlined,
            onTap: () {
              Navigator.of(context).popAndPushNamed('/edit-quiz');
            }),
        const Divider(
          color: Color.fromARGB(255, 10, 10, 10),
        ),
        CustomListTile(
            active: active == "Home Page",
            text: "Home Page",
            iconData: Icons.home_outlined,
            iconSize: 28,
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
              changePage("Home Page");
            }),
      ],
    );
