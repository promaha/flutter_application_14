import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/model/getdata_model.dart';

class ResultController {
  sumMark(final Map<String, dynamic> data) {
    int sumMark = 0;
    sumMark = data['level1'] +
        data['level2'] +
        data['level3'] +
        data['level4'] +
        data['level5'] +
        data['level6'] +
        data['level7'];
    return sumMark;
  }

  getGrade(int obtaindMarks) {
    if (obtaindMarks >= 90) {
      return 'A';
    } else if (obtaindMarks >= 80) {
      return 'B';
    } else if (obtaindMarks >= 70) {
      return 'C';
    } else if (obtaindMarks >= 60) {
      return 'D';
    } else {
      return 'E';
    }
  }
}

// ignore: non_constant_identifier_names
// List<ResultController> LevelsMark = getStudentMark();

// التقدير
class Appreciation extends StatelessWidget {
  const Appreciation(
      {super.key, required this.obtaindMarks, required this.totalMarks});
  final int obtaindMarks;
  final int totalMarks;
  getAppreciation() {
    if (obtaindMarks >= (totalMarks / 2)) {
      return 'ناجح';
    } else {
      return 'راسب';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getAppreciation(),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w900,
          ),
    );
  }
}
