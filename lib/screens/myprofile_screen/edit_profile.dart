import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static String routeName = 'EditProfileScreen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " تعديل الملف الشخصي",
          style: TextStyle(color: kTextWhiteColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kOtherColor,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
