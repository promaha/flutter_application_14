import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static String routeName = 'EditProfileScreen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isObscurePassword = true;

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
              height: 200, //MediaQuery.of(context).size.height / 2.8,
              padding: EdgeInsets.only(top: 45),
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
                        image: DecorationImage(
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
                        child: Icon(
                          Icons.edit,
                          color: kOtherColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            BuildAgeAndGoal("اسم المستخدم"),
            sizedBox,
            buildTextFieldEmail(),
            BuildPasswordField(),
            sizedBox,
            BuildAgeAndGoal("الهدف من الدراسة"),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallButton(onPress: () {}, title: "إلغاء"),
                SmallButton(onPress: () {}, title: "حفظ")
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldEmail() {
    return Padding(
        padding: EdgeInsets.only(
          bottom: 30,
        ),
        child: TextFormField(
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: kTextBlackColor,
            fontSize: 17.0,
            fontWeight: FontWeight.w300,
          ),
          decoration: InputDecoration(
            labelText: "الإيميل",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
          ),
          validator: (value) {
            RegExp regExp = RegExp(emailPattern);
            if (value == null || value.isEmpty) {
              return "الرجاء ادخال المطلوب";
            } else if (!regExp.hasMatch(value)) {
              return "الرجاء ادخال ايميل بشكل صحيح";
            }
            return null;
          },
        )
        //TextField(
        // obscureText: isPasswordTextField ? isObscurePassword : false,
        // decoration: InputDecoration(
        //     suffixIcon: isPasswordTextField
        //         ? IconButton(
        //             onPressed: () {
        //               setState(() {
        //                 isObscurePassword = !isObscurePassword;
        //               });
        //             },
        //             icon: const Icon(Icons.remove_red_eye),
        //             color: kTextBlackColor,
        //           )
        //         : null,
        //     contentPadding: EdgeInsets.only(bottom: 5),
        //     labelText: labelText,
        //     floatingLabelBehavior: FloatingLabelBehavior.always,
        //     hintText: placeholder,
        //     hintStyle: const TextStyle(
        //       fontSize: 10,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.grey,
        //     )),
        //     ),
        );
  }

  TextFormField BuildPasswordField() {
    return TextFormField(
      obscureText: isObscurePassword,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        labelText: "كلمة المرور",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscurePassword = !isObscurePassword;
            });
          },
          icon: Icon(isObscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_off_outlined),
        ),
      ),
      validator: (value) {
        if (value!.length < 5) return "يجب ان تكون اكثر من 5 رموز";
        return null;
      },
    );
  }

  TextFormField BuildAgeAndGoal(String title) {
    return TextFormField(
      obscureText: isObscurePassword,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        labelText: title,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
    );
  }
}
