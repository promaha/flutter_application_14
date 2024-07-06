import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/controller/profile_controller.dart';
import 'package:flutter_application_14/model/profile_model.dart';
import 'package:flutter_application_14/screens/myprofile_screen/my_profile.dart';
import 'package:flutter_application_14/screens/myprofile_screen/profile_class_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  static String routeName = 'EditProfileScreen';

  final controller = ProfileController();
  final controllerModel = ProfileModel();
  final _foemKey = GlobalKey<FormState>();

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
      backgroundColor: kOtherColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.8,
              padding: const EdgeInsets.only(top: 45),
              color: kPrimaryColor,
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: kOtherColor),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/images/student_profile.jpeg"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: kOtherColor,
                          ),
                          color: kPrimaryColor,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: kOtherColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: _foemKey,
                child: Column(
                  children: [
                    BuildName("اسم المستخدم", controller.ename),
                    sizedBox,
                    // buildTextFieldEmail(controller.eemail),
                    BuildName("العمر", controller.eage),
                    sizedBox,
                    BuildGoal("الهدف من الدراسة", controller.egoalOfStudy),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SmallButton(onPress: () {}, title: "إلغاء"),
                        SmallButton(
                            onPress: () async {
                              if (_foemKey.currentState!.validate()) {
                                await controllerModel.setUser(
                                  controller.ename.text,
                                  // controller.epassword,
                                  controller.eage.text,
                                  controller.egoalOfStudy.text,
                                );
                                Get.offNamed(MyProfileScreen.routeName);
                              }
                            },
                            title: "حفظ"),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
