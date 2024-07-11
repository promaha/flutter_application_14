import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';

class CircularPainter extends CustomPainter {
  final Color backgroundColor;
  final Color lineColor;
  final double width;

  CircularPainter(
      {super.repaint,
      required this.backgroundColor,
      required this.lineColor,
      required this.width});

  @override
  void paint(canvas, Size size) {
    // TODO: implement paint

    Paint backgroundLine = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset cen = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    double sweepAngle = 2 * pi;
    canvas.drawCircle(cen, radius, backgroundLine);
    canvas.drawArc(Rect.fromCircle(center: cen, radius: radius), -pi / 2,
        sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ResultLevels extends StatelessWidget {
  const ResultLevels(
      {super.key,
      required this.levelName,
      required this.totalMarks,
      required this.obtaindMarks,
      required this.grade});
  final String levelName;
  final int totalMarks; //المجموع
  final int obtaindMarks; //العلامة التي تم الحصول عليها
  final String grade;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
          boxShadow: const [
            BoxShadow(
              color: kTextLightColor,
              blurRadius: 2.0,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                levelName,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kTextWhiteColor, // Replace with the desired color
                    ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${obtaindMarks} / ${totalMarks}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color:
                              kTextWhiteColor, // Replace with the desired color
                        ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: totalMarks.toDouble(),
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kDefaultPadding),
                            bottomRight: Radius.circular(kDefaultPadding),
                          ),
                        ),
                      ),
                      Container(
                        width: obtaindMarks.toDouble(),
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: grade == 'D' ? kErrorBorderColor : kOtherColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kDefaultPadding),
                            bottomRight: Radius.circular(kDefaultPadding),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    grade,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: kTextWhiteColor,
                          fontWeight: FontWeight.w900,
                        ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   CollectionReference users = FirebaseFirestore.instance.collection('infoUser');
//   return FutureBuilder<QuerySnapshot>(
//       future: users
//           .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .get(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Center(child: Text("Something went wrong"));
//         }

//         if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
//           return const Center(child: Text(" "));
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.docs.first.data() as Map<String, dynamic>;
//           return StudentName(
//             studentName: data[nameOfVariable],
//           );
//         }

//         return const Center(child: CircularProgressIndicator());
//       });
// }
