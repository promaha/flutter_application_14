import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/screens/contact_screen/contact_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static String routeName = 'MyProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الملف الشخصي",
          style: TextStyle(color: kTextWhiteColor),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ContactScreen.routeName);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(right: kDefaultPadding / 2),
              child: const Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Icon(
                    Icons.phone,
                    color: kOtherColor,
                  ),
                ],
              ),
            ),
          ),
        ],
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
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(kDefaultPadding * 2),
                  bottomLeft: Radius.circular(kDefaultPadding * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
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
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14.0, color: kTextWhiteColor),
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
              iconProfile: Icons.person_2_outlined,
            ),
            ProfileDetailColumn(
              title: "العمر",
              value: "22",
              iconProfile: Icons.calendar_today_outlined,
            ),
            ProfileDetailColumn(
              title: "الايميل",
              value: "maha12@gmail.com",
              iconProfile: Icons.email_outlined,
            ),
            ProfileDetailColumn(
              title: "الهدف من الدراسة",
              value: "التعلم",
              iconProfile: Icons.school_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {super.key,
      required this.title,
      required this.value,
      required this.iconProfile});
  final String title;
  final String value;
  final IconData iconProfile;

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
                      color: kTextBlackColor,
                      fontSize: 15.0,
                    ),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kTextBlackColor,
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
            iconProfile,
            size: 20.0,
          )
        ],
      ),
    );
  }
}
