import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/controller/result_controller.dart';
import 'package:flutter_application_14/model/getdata_model.dart';
import 'package:flutter_application_14/screens/result_screen/component/result_component.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  static String routeName = "ResultScreen";
  ResultController resultController = ResultController();

  @override
  Widget build(BuildContext context) {
    // int oMarks = result.map((e) => e.obtaindMarks).sum.toInt();
    // int tMarks = result.map((e) => e.totalMarks).sum.toInt();
    CollectionReference users =
        FirebaseFirestore.instance.collection('infoUser');
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "النتيجة",
            style: TextStyle(color: kTextWhiteColor),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: users
                .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }

              if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                return const Center(child: Text(" "));
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.docs.first.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    Container(
                      height: 200,
                      margin: const EdgeInsets.all(30),
                      child: CustomPaint(
                        foregroundPainter: CircularPainter(
                            backgroundColor: kPrimaryColor,
                            lineColor: kOtherColor,
                            width: 15),
                        child: Center(
                          child: Text(
                            // oMarks.toString() + "\n / \n" + tMarks.toString()
                            resultController.sumMark(data).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: kTextWhiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Appreciation(
                      obtaindMarks: resultController.sumMark(data),
                      totalMarks: 100,
                    ),
                    const GetStudentInfo(
                      nameOfVariable: 'name',
                    ),
                    sizedBox,
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kOtherColor,
                          ),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(kDefaultPadding),
                            children: [
                              Column(
                                children: [
                                  ResultLevels(
                                    levelName: 'المستوى الاول',
                                    obtaindMarks: (data['level1'] / 100) * 100,
                                    totalMarks: 100,
                                    grade: resultController
                                        .getGrade((data['level1'] / 100) * 100),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
