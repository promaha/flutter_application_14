import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/controller/profile_controller.dart';
import 'package:flutter_application_14/screens/myprofile_screen/contact_screen.dart';
import 'package:flutter_application_14/screens/myprofile_screen/edit_profile.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MyProfileScreen extends StatelessWidget {
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
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed("LoginScreen");
              },
              icon: Icon(
                Icons.exit_to_app,
                color: kOtherColor,
              )),
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
                      Text("أهلا مها ",
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
            GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (controller) {
                  return Column(
                    children: [
                      ProfileDetailColumn(
                        title: "name",
                        value: controller.pname.text,
                        iconProfile: Icons.person_2_outlined,
                      ),
                      ProfileDetailColumn(
                        title: "email",
                        value: controller.pemail.text,
                        iconProfile: Icons.person_2_outlined,
                      ),
                      ProfileDetailColumn(
                        title: "password",
                        value: controller.ppassword.text,
                        iconProfile: Icons.person_2_outlined,
                      ),
                      ProfileDetailColumn(
                        title: "goal of study",
                        value: controller.pgoalOfStudy.text,
                        iconProfile: Icons.person_2_outlined,
                      ),
                    ],
                  );
                }),
            // Barcodewidget(
            //   Widget: MediaQuery.of(context).size.width / 2,
            //   height: MediaQuery.of(context).size.height / 2,
            //   data: 'كود التطبيق',
            //   barcode: Barcode.qrcode(),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: BarcodeWidget(
                  width: 120, // MediaQuery.of(context).size.width / 2,
                  height: 120, //MediaQuery.of(context).size.height / 2,
                  color: kPrimaryColor,
                  data: 'كود التطبيق',
                  barcode: Barcode.qrCode(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EditProfileScreen.routeName);
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.edit,
          color: kOtherColor,
        ),
      ),
    );
  }
}
