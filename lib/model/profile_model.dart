import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/screens/myprofile_screen/my_profile.dart';
import 'package:get/get.dart';

class ProfileModel {
  //=============================

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Future<void> setUser(
    String ename,
    String eage,
    String egoalOfStudy,
  ) async {
    // Call the user's CollectionReference to add a new user
    CollectionReference infoUser =
        FirebaseFirestore.instance.collection('infoUser');
    Query query =
        infoUser.where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
    QuerySnapshot snapshot = await query.get();
    if (snapshot.docs.isNotEmpty) {
      final DocumentSnapshot document = snapshot.docs.first;
      infoUser
          .doc(document.id)
          .set({
            'name': ename,
            'age': eage,
            'goal': egoalOfStudy,
          }, SetOptions(merge: true))
          .then(
            (value) => Get.offNamed(MyProfileScreen.routeName),
          )
          .catchError((error) {
            Get.snackbar("", "$error");
            return Future.error(error);
          });
    }
  }

  Future<void> addUser(
    String ename,
    String eage,
    String email,
    String egoalOfStudy,
  ) {
    // Call the user's CollectionReference to add a new user
    CollectionReference infoUser =
        FirebaseFirestore.instance.collection('infoUser');
    return infoUser
        .add({
          'name': ename, // John Doe
          'age': eage, // Stokes and Sons
          'goal': egoalOfStudy, // Stokes and Sons
          'email': email, // Stokes and Sons
          'id': FirebaseAuth.instance.currentUser!.uid,
        })
        .then(
          (value) => Get.offNamed(MyProfileScreen.routeName),
        )
        .catchError((error) {
          Get.snackbar("", "$error");
          return Future.error(error);
        });
  }
}
