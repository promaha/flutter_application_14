import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/model/profile_model.dart';
import 'package:flutter_application_14/screens/pageslessons_screen.dart/pagelesson_model.dart';
import 'package:flutter_application_14/screens/pageslessons_screen.dart/pagelesson_test.dart';
import 'package:get/get.dart';

class PagesLessonsScreen extends StatefulWidget {
  const PagesLessonsScreen({super.key});
  static String routeName = 'PagesLessonsScreen';

  @override
  State<PagesLessonsScreen> createState() => _PagesLessonsScreenState();
}

class _PagesLessonsScreenState extends State<PagesLessonsScreen> {
  int trans = -1, trans2 = -1, totalOfLevel = 0;
  late PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "الأعداد",
          style: TextStyle(color: kTextWhiteColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //  Define the action when the back button is pressed
                //  For example, you can navigate to the previous screen
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ))
        ],
      ),
      // Other properties of the app bar...

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          itemCount: screens.length + screensTest.length,
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemBuilder: (context, index) {
            if (index + 1 == (screens.length + screensTest.length)) {
              return Column(
                children: [
                  const SizedBox(
                    height: 300,
                  ),
                  const Text(
                    " انقر للعودة لصفحة الدروس",
                    style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        color: kTextBlackColor),
                  ),
                  MoveButton(
                    onPress: () {
                      ProfileModel profileModel = ProfileModel();
                      profileModel.setLevel(totalOfLevel);
                      Get.back();
                    },
                    icon: Icons.arrow_circle_left,
                  ),
                ],
              );
            }
            if (index % 3 != 0 || index == 0) {
              trans++;
              final screenData = screens[trans];

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        screenData.img,
                        fit: BoxFit.fill,
                      )),
                  Text(
                    screenData.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        color: kTextBlackColor),
                  ),
                  // if(trans == screens.length)
                  // return 0 ;
                  MoveButton(
                    onPress: () {
                      _pageController.nextPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.bounceIn);
                    },
                    icon: Icons.arrow_circle_left,
                  ),
                ],
              );
            } else {
              trans2++;
              final testScreenData = screensTest[trans2];
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        testScreenData.img,
                        fit: BoxFit.fill,
                      )),
                  const Text(
                    "على ماذا تدل الصورة: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        color: kTextBlackColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TestButton(
                        onPress: () {
                          totalOfLevel += testScreenData.choiceOneCorrectt;
                          _pageController.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                        },
                        text: testScreenData.choice1,
                      ),
                      TestButton(
                        onPress: () {
                          totalOfLevel += testScreenData.choiceTwoCorrectt;
                          _pageController.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                        },
                        text: testScreenData.choice2,
                      )
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
