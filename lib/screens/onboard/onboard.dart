import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/login_screen/login_screen.dart';
import 'package:flutter_application_14/screens/home_screen/home_screen.dart';
import 'package:flutter_application_14/screens/onboard/onboard_model.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});
  static String routeName = 'OnBoardScreen';

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _currentIndex = 0;
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      appBar: AppBar(
        backgroundColor: kOtherColor,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text(
                "تخطي",
                style: TextStyle(
                  color: kTextBlackColor,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(screens[index].img),
                Container(
                  height: 10.0,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            width: _currentIndex == index ? 25.0 : 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  screens[index].text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      color: kTextBlackColor),
                ),
                Text(
                  screens[index].desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
                InkWell(
                  onTap: () {
                    if (index == screens.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                    _pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.bounceIn);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "التالي",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: kTextWhiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: kOtherColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
