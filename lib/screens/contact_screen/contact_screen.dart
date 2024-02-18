import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  static String routeName = 'ContactScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'مؤسسة الصم والبكم',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 38.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'تعليم لغة الاشارة',
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 20.0,
              child: Divider(
                color: Colors.cyan[100],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.cyan[700],
                ),
                title: Text(
                  '+43 234 567 89',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.cyan[700],
                ),
                title: Text(
                  'a123@email.com',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
