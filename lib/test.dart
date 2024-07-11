import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStudentMark extends StatefulWidget {
  const GetStudentMark({super.key, required this.name});
  final String name;

  @override
  _GetStudentMarkState createState() => _GetStudentMarkState();
}

class _GetStudentMarkState extends State<GetStudentMark> {
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    getDdd();
  }

  getDdd() async {
    CollectionReference infoUser =
        FirebaseFirestore.instance.collection('infoUser');
    Query query =
        infoUser.where('id', isEqualTo: "ts26QW73nLhdpka9lN00iTPEfaE3");
    QuerySnapshot snapshot = await query.get();

    if (snapshot.docs.isNotEmpty) {
      data = snapshot.docs.first.data() as Map<String, dynamic>;
      setState(() {});
    } else {
      data = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name=============== :${data![widget.name]}",
          ),
          const SizedBox(height: 16.0),
          Text(data!['level1'].toString()),
          const SizedBox(height: 8.0),
          Text(data!['level2'].toString()),
          const SizedBox(height: 8.0),
          Text('level3\n0\n(number)'),
          const SizedBox(height: 8.0),
          Text('level4\n0\n(number)'),
          const SizedBox(height: 8.0),
          Text('level5\n0\n(number)'),
          const SizedBox(height: 8.0),
          Text('level6\n0\n(number)'),
          const SizedBox(height: 8.0),
          Text('level7\n0\n(number)'),
          const SizedBox(height: 8.0),
          Text('level8\n0\n(number)'),
        ],
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: GetStudentMark(name: 'name'),
        color: Colors.amber,
      ),
    );
  }
}
