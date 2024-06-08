import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';

class WordsScreen extends StatelessWidget {
  WordsScreen({super.key});
  static String routeName = 'WordsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الأعداد",
          style: TextStyle(color: kTextWhiteColor),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // Replace with your custom icont

          onPressed: () {
            // Define the action when the back button is pressed
            // For example, you can navigate to the previous screen
            Navigator.pop(context);
          },
        ),
        // Other properties of the app bar...
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          //head
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Container(
              height: 1000,
              color: Theme.of(context).primaryColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
//padding: EdgeInsets.only(bottom: 200),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Expanded(
                    child: Column(
                      // physics: const NeverScrollableScrollPhysics(),
                      // crossAxisCount: 1,
                      // crossAxisSpacing: 40,
                      // mainAxisSpacing: 30,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          child: Container(
                            height: 300,
                            width: 600,
                            child: const Image(
                              image: AssetImage(
                                  "assets/images/ابن 00_00_00-00_00_30.gif"),

                              fit: BoxFit.fill,
                              // image: AssetImage("assets/images/etegahat.gif"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "ابن",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            MoveButton(
                              onPress: () {},
                              icon: Icons.arrow_circle_right,
                            ),
                            MoveButton(
                              onPress: () {},
                              icon: Icons.arrow_circle_left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
