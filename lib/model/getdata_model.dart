import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/screens/home_screen/widgets/student_data.dart';

class GetUserInfo extends StatelessWidget {
  final String nameInList;
  final String documentId;
  final String title;
  final IconData iconProfile;

  const GetUserInfo(
      {super.key,
      required this.nameInList,
      required this.documentId,
      required this.title,
      required this.iconProfile});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('infoUser');

    return FutureBuilder<QuerySnapshot>(
      future: users
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
          return const Center(child: Text(" "));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.docs.first.data() as Map<String, dynamic>;
          return ProfileDetailColumn(
            title: title,
            value: data[nameInList],
            iconProfile: iconProfile,
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class GetStudentName extends StatelessWidget {
  const GetStudentName({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('infoUser');
    return FutureBuilder<QuerySnapshot>(
        future: users
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const Center(child: Text(" "));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.docs.first.data() as Map<String, dynamic>;
            return StudentName(
              studentName: data['name'],
            );
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
