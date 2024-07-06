import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_14/constants.dart';

bool isObscurePassword = true;
TextFormField BuildGoal(String title, TextEditingController controller) {
  return TextFormField(
    obscureText: false,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.visiblePassword,
    controller: controller,
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
    validator: (value) {
      if (value!.isEmpty) return "مازال الحقل فارغا ";
      return null;
    },
  );
}

TextFormField BuildName(String title, TextEditingController controller) {
  return TextFormField(
    obscureText: false,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.visiblePassword,
    controller: controller,
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
    validator: (value) {
      if (value!.isEmpty) return "مازال الحقل فارغا ";
      return null;
    },
  );
}

// TextFormField BuildAge(String title) {
//   return TextFormField(
//     obscureText: false,
//     textAlign: TextAlign.center,
//     keyboardType: TextInputType.visiblePassword,
//     // controller: ,
//     style: const TextStyle(
//       color: kTextBlackColor,
//       fontSize: 17.0,
//       fontWeight: FontWeight.w300,
//     ),
//     onChanged: (value) {
//       //age = value;
//     },
//     decoration: InputDecoration(
//       labelText: title,
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       isDense: true,
//     ),
//   );
// }

Widget buildTextFieldEmail(TextEditingController controller) {
  return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: kTextBlackColor,
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
        ),
        decoration: const InputDecoration(
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
      ));
}

TextFormField BuildPasswordField(TextEditingController controller) {
  return TextFormField(
    obscureText: isObscurePassword,
    textAlign: TextAlign.start,
    keyboardType: TextInputType.visiblePassword,
    controller: controller,
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
          // setState(() {
          //   isObscurePassword = !isObscurePassword;
          // });
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
