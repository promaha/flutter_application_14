import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //take to edite
  TextEditingController ename = TextEditingController();
  TextEditingController eage = TextEditingController();
  TextEditingController eemail = TextEditingController();
  TextEditingController egoalOfStudy = TextEditingController();

//to show in profile
  TextEditingController pname = TextEditingController();
  TextEditingController page = TextEditingController();
  TextEditingController pgoalOfStudy = TextEditingController();

  // void save() {
  //   pname.text = ename.text;
  //   ppassword.text = epassword.text;
  //   pemail.text = eemail.text;
  //   pgoalOfStudy.text = egoalOfStudy.text;
  // }
}
