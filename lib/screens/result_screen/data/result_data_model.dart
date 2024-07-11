// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_14/model/get_marks.dart';

// class ResultDataModel {
//   late final int totalMarks; //المجموع
//   late final int obtaindMarks; //العلامة التي تم الحصول عليها
//   ResultDataModel(this.totalMarks, this.obtaindMarks);
// }

// GetStudentMArks getStudentMArks = GetStudentMArks();
// Map<String, dynamic> marks = {};
// takeMark() async {
//   marks = await getStudentMArks.getStudentMark();
// }

// List<ResultDataModel> result = [
//   ResultDataModel(100, marks['level1']),
//   ResultDataModel(100, marks['level2']),
//   ResultDataModel(100, marks['level3']),
//   ResultDataModel(
//     100,
//     50,
//   ),
//   ResultDataModel(
//     100,
//     50,
//   ),
//   ResultDataModel(
//     100,
//     50,
//   ),
//   ResultDataModel(
//     100,
//     50,
//   ),
//   ResultDataModel(
//     100,
//     50,
//   ),
// ];

// // List<ResultDataModel> result = [];

// // // الاتصال بـ Firestore
// // FirebaseFirestore firestore = FirebaseFirestore.instance;

// // // استرداد البيانات من مجموعة الوثائق "your_collection_name"
// // firestore.collection('infoUser')
// //     .get()
// //     .then((QuerySnapshot querySnapshot) {
// //   // ملء القائمة result بالبيانات من Firestore
// //   for (var doc in querySnapshot.docs) {
// //     String subjectName = doc.get("subjectName");
// //     int totalMarks = doc.get("totalMarks");
// //     int obtainedMarks = doc.get("obtainedMarks");
// //     String grade = doc.get("grade");

// //     result.add(ResultDataModel(subjectName, totalMarks, obtainedMarks, grade));
// //   }
// // })
// // .catchError((error) {
// //   // معالجة أي أخطاء
// //   print("Error getting documents: $error");
// // // });