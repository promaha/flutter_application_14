import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter_application_1/cloths.dart';
// import 'package:flutter_application_1/colors.dart';
// import 'package:flutter_application_1/family.dart';
// import 'package:flutter_application_1/letters.dart';
// import 'package:flutter_application_1/numbers.dart';
// import 'package:flutter_application_1/quiz.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});
  static String routeName = 'LessonScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          //head
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('الدروس',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('المستوى الاول',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            height: 1000,
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
//padding: EdgeInsets.only(bottom: 200),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: GridView.count(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  //numbers
                  LessonsCard(
                      onPress: () {
                        Navigator.pushNamed(context, routeName);
                      },
                      icon: "assets/icons/ask.svg",
                      title: "الاحرف"),
                  LessonsCard(
                      onPress: () {
                        Navigator.pushNamed(context, routeName);
                      },
                      icon: "assets/icons/ask.svg",
                      title: " الارقام"),
                  LessonsCard(
                      onPress: () {
                        Navigator.pushNamed(context, routeName);
                      },
                      icon: "assets/icons/ask.svg",
                      title: " الاسرة"),
                  LessonsCard(
                      onPress: () {
                        Navigator.pushNamed(context, routeName);
                      },
                      icon: "assets/icons/ask.svg",
                      title: "المستوى الاول"),
                  LessonsCard(
                      onPress: () {
                        Navigator.pushNamed(context, routeName);
                      },
                      icon: "assets/icons/ask.svg",
                      title: "المستوى الاول"),
                  LessonsCard(
                      onPress: () {
                        Navigator.pushNamed(context, routeName);
                      },
                      icon: "assets/icons/ask.svg",
                      title: "المستوى الاول"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class LessonsCard extends StatelessWidget {
  const LessonsCard(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.title});
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 40.0,
              width: 40.0,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: kTextWhiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
