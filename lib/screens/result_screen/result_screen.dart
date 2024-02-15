import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/screens/result_screen/component/result_component.dart';
import 'package:flutter_application_14/screens/result_screen/data/result_data.dart';
import 'package:collection/collection.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static String routeName = "ResultScreen";
  @override
  Widget build(BuildContext context) {
    int oMarks = result.map((e) => e.obtaindMarks).sum.toInt();
    int tMarks = result.map((e) => e.totalMarks).sum.toInt();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "النتيجة",
          style: TextStyle(color: kTextWhiteColor),
        ),
      ),
      body: Column(
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
                  oMarks.toString() + "\n / \n" + tMarks.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: kTextWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Text(
            "ممتاز",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          Text(
            "مها",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          sizedBox,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kOtherColor,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(kDefaultPadding),
                itemCount: result.length,
                itemBuilder: (context, index) {
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
                              result[index].subjectName,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color:
                                        kTextWhiteColor, // Replace with the desired color
                                  ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${result[index].obtaindMarks} / ${result[index].totalMarks}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color:
                                            kTextWhiteColor, // Replace with the desired color
                                      ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width:
                                          result[index].totalMarks.toDouble(),
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        borderRadius: const BorderRadius.only(
                                          topLeft:
                                              Radius.circular(kDefaultPadding),
                                          bottomRight:
                                              Radius.circular(kDefaultPadding),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          result[index].obtaindMarks.toDouble(),
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: result[index].grade == 'D'
                                            ? kErrorBorderColor
                                            : kOtherColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft:
                                              Radius.circular(kDefaultPadding),
                                          bottomRight:
                                              Radius.circular(kDefaultPadding),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  result[index].grade,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
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
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
