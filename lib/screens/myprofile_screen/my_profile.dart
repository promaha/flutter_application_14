import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/model/getdata_model.dart';
import 'package:flutter_application_14/screens/myprofile_screen/contact_screen.dart';
import 'package:flutter_application_14/screens/myprofile_screen/edit_profile.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
                // print("out the try");
                // GoogleSignIn googleSignIn = GoogleSignIn();
                // googleSignIn!.disconnect();

                // await FirebaseAuth.instance.signOut();
                // Get.offAllNamed("LoginScreen");
                try {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  await googleSignIn.disconnect();
                  await FirebaseAuth.instance.signOut();
                  Get.offAllNamed("LoginScreen");
                } catch (e) {
                  await FirebaseAuth.instance.signOut();
                  Get.offAllNamed("LoginScreen");
                  // Handle the exception or display an error message to the user
                }
              },
              icon: const Icon(
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
          onPressed: () {
            Get.back();
          },
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
                        const GetStudentInfo(
                          nameOfVariable: 'name',
                        ),
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        GetUserInfo(
                            nameInList: "name",
                            documentId: FirebaseAuth.instance.currentUser!.uid,
                            title: "الاسم",
                            iconProfile: Icons.person_2_outlined),
                        GetUserInfo(
                            nameInList: "age",
                            documentId: FirebaseAuth.instance.currentUser!.uid,
                            title: "العمر",
                            iconProfile: Icons.date_range),
                        GetUserInfo(
                            nameInList: "email",
                            documentId: FirebaseAuth.instance.currentUser!.uid,
                            title: "البريد الالكتروني",
                            iconProfile: Icons.email),
                        GetUserInfo(
                            nameInList: "goal",
                            documentId: FirebaseAuth.instance.currentUser!.uid,
                            title: "الهدف من الدراسة",
                            iconProfile: Icons.school_outlined),
                      ],
                    ),
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
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(EditProfileScreen.routeName);
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
