// import 'package:flutter/material.dart';
// import 'package:flutter_application_14/model/profile_model.dart';
// import 'package:flutter_application_14/model/toShareOnApp.dart';
// import 'package:get/get.dart';

// class Test extends StatelessWidget {
//   ProfileModel profileModel = ProfileModel();
//   UserNameController userNameController = Get.put(UserNameController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           GetBuilder<UserNameController>(
//             init: UserNameController(),
//             builder: (controller) =>
//                 Text("Name Is :   ${controller.userNameToUpdate}"),
//           ),
//           MaterialButton(
//             onPressed: () {
//               profileModel.getDataUser();
//             },
//             child: Text('OK'),
//           )
//         ],
//       ),
//     );
//   }
// }
