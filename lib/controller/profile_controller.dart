import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController ename = TextEditingController();
  TextEditingController epassword = TextEditingController();
  TextEditingController eemail = TextEditingController();
  TextEditingController egoalOfStudy = TextEditingController();

  TextEditingController pname = TextEditingController();
  TextEditingController ppassword = TextEditingController();
  TextEditingController pemail = TextEditingController();
  TextEditingController pgoalOfStudy = TextEditingController();

  void save() {
    pname = ename;
    ppassword = epassword;
    pemail = eemail;
    pgoalOfStudy = egoalOfStudy;
    update();
  }
}
