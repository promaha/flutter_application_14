import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/screens/home_screen/widgets/student_data.dart';
import 'package:flutter_application_14/screens/my_profile/my_profile.dart';
import 'package:flutter_application_14/screens/result_screen/result_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(studentName: 'مها'),
                        kHalfSizedBox,
                        StudentClass(studentClass: "المستوى الأول"),
                        kHalfSizedBox,
                        StudentYear(studentYear: "2024- 2025")
                      ],
                    ),
                    kHalfSizedBox,
                    StudentPicture(
                        picAdress: "assets/images/student_profile.jpeg",
                        onPress: () {
                          Navigator.pushNamed(
                              context, MyProfileScreen.routeName);
                        })
                  ],
                ),
                sizedBox,
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3),
                  ),
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        LevelsCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                        LevelsCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                        LevelsCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                        LevelsCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                        LevelsCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                        LevelsCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                        LevelsCard(
                            onPress: () {},
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                        LevelsCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, ResultScreen.routeName);
                            },
                            icon: "assets/icons/ask.svg",
                            title: "المستوى الاول"),
                      ],
                    )
                  ],
                ),

                // child: SingleChildScrollView(
                //   child: Column(
                //     children: [
                //       Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: 100, //MediaQuery.of(context).size.height / 2.5,
                //         // Rest of your code...
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           decoration: const BoxDecoration(
                //             color: kOtherColor,
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(kDefaultPadding * 3),
                //               topRight: Radius.circular(kDefaultPadding * 3),
                //             ),
                //           ),
                //           child: TextButton(
                //             onPressed: () {
                //               // Rest of your code...
                //             },
                //             child: Padding(
                //               padding: const EdgeInsets.all(10.0),
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(10),
                //                 child: Container(
                //                   height: 100,
                //                   width: 400,
                //                   decoration: const BoxDecoration(
                //                     image: DecorationImage(
                //                       image: AssetImage('assets/images/1.png'),
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: 100, //MediaQuery.of(context).size.height / 2.5,
                //         // Rest of your code...
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           decoration: const BoxDecoration(
                //             color: kOtherColor,
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(kDefaultPadding * 3),
                //               topRight: Radius.circular(kDefaultPadding * 3),
                //             ),
                //           ),
                //           child: TextButton(
                //             onPressed: () {
                //               // Rest of your code...
                //             },
                //             child: Padding(
                //               padding: const EdgeInsets.all(10.0),
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(10),
                //                 child: Container(
                //                   height: 100,
                //                   width: 400,
                //                   decoration: const BoxDecoration(
                //                     image: DecorationImage(
                //                       image: AssetImage('assets/images/2.png'),
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: 100, //MediaQuery.of(context).size.height / 2.5,
                //         // Rest of your code...
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           decoration: const BoxDecoration(
                //             color: kOtherColor,
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(kDefaultPadding * 3),
                //               topRight: Radius.circular(kDefaultPadding * 3),
                //             ),
                //           ),
                //           child: TextButton(
                //             onPressed: () {
                //               // Rest of your code...
                //             },
                //             child: Padding(
                //               padding: const EdgeInsets.all(10.0),
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(10),
                //                 child: Container(
                //                   height: 100,
                //                   width: 400,
                //                   decoration: const BoxDecoration(
                //                     image: DecorationImage(
                //                       image: AssetImage('assets/images/3.png'),
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: 100, //MediaQuery.of(context).size.height / 2.5,
                //         // Rest of your code...
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           decoration: const BoxDecoration(
                //             color: kOtherColor,
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(kDefaultPadding * 3),
                //               topRight: Radius.circular(kDefaultPadding * 3),
                //             ),
                //           ),
                //           child: TextButton(
                //             onPressed: () {
                //               // Rest of your code...
                //             },
                //             child: Padding(
                //               padding: const EdgeInsets.all(10.0),
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(10),
                //                 child: Container(
                //                   height: 100,
                //                   width: 400,
                //                   decoration: const BoxDecoration(
                //                     image: DecorationImage(
                //                       image: AssetImage('assets/images/4.png'),
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LevelsCard extends StatelessWidget {
  const LevelsCard(
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
        margin: EdgeInsets.only(top: kDefaultPadding),
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              icon,
              height: 40.0,
              width: 40.0,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.start,
              // style: Theme.of(context).textTheme.titleSmall,
              style: TextStyle(fontSize: 20.0, color: kTextWhiteColor),
            )
          ],
        ),
      ),
    );
  }
}
