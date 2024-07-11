import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetStudentMArks {
  final Map<String, dynamic> data;
  GetStudentMArks({required this.data});

  Future<Map<String, dynamic>> getStudentMark() async {
    CollectionReference infoUser =
        FirebaseFirestore.instance.collection('infoUser');
    Query query =
        infoUser.where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
    QuerySnapshot snapshot = await query.get();

    if (snapshot.docs.isNotEmpty) {
      Map<String, dynamic> data =
          snapshot.docs.first.data() as Map<String, dynamic>;
      return data;
    } else {
      return {};
    }
  }
}
