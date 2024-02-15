import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/screens/home_screen/widgets/student_data.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static String routeName = 'MyProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الملف الشخصي",
          style: TextStyle(color: kTextWhiteColor),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Container(
        //       child: Padding(
        //         padding: const EdgeInsets.only(right: kDefaultPadding / 2),
        //         // child: Row(
        //         //   children: [
        //         //     Icon(Icons.report_gmailerrorred_outlined),
        //         //     kHalfSizedBox,
        //         //     Text(
        //         //       "Report",
        //         //       style: Theme.of(context).textTheme.titleMedium,
        //         //     )
        //         //   ],
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(kDefaultPadding * 2),
                  bottomLeft: Radius.circular(kDefaultPadding * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundColor: kSecondaryColor,
                    backgroundImage:
                        AssetImage("assets/images/student_profile.jpeg"),
                  ),
                  kWidthSizedBox,
                  Column(
                    children: [
                      Text("مها",
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        "المستوى الاول",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 14.0,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sizedBox,
            ProfileDetailColumn(
              title: "الاسم",
              value: "مها",
            ),
            ProfileDetailColumn(
              title: "العمر",
              value: "22",
            ),
            ProfileDetailColumn(
              title: "الايميل",
              value: "maha12@gmail.com",
            ),
            ProfileDetailColumn(
              title: "الهدف من الدراسة",
              value: "التعلم",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kTextLightColor,
                      fontSize: 15.0,
                    ),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kTextLightColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          Icon(
            Icons.email_outlined,
            size: 20.0,
          )
        ],
      ),
    );
  }
}
