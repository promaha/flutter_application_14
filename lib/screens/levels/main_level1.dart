import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_card.dart';
import 'package:flutter_application_14/model/levels_model.dart';
import 'package:get/get.dart';

class MainLevel1 extends StatefulWidget {
  static String routeName = 'MainLevel1';

  @override
  State<MainLevel1> createState() => _MainLevel1State();
}

class _MainLevel1State extends State<MainLevel1> {
  late List<dynamic> listOfLevel;
  @override
  void initState() {
    // TODO: implement initState
    listOfLevel = Get.arguments as List<dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          //head
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('الدروس',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text(listOfLevel.first.levelName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            height: 1000,
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
//padding: EdgeInsets.only(bottom: 200),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: GridView.builder(
                itemCount: Level1Data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: LessonsCard(
                        onPress: listOfLevel[index].onPress,
                        icon: listOfLevel[index].icon,
                        title: listOfLevel[index].title),
                  );
                },
                //   children: [
                //     //numbers

                //     LessonsCard(
                //         onPress: () {
                //           Get.toNamed('PagesLessonsScreen');
                //         },
                //         icon: "assets/icons/ask.svg",
                //         title: " الارقام"),
                //     //
                //     LessonsCard(
                //         onPress: () {
                //           Navigator.pushNamed(context, routeName);
                //         },
                //         icon: "assets/icons/ask.svg",
                //         title: " الالوان"),
                //     //
                //     LessonsCard(
                //         onPress: () {
                //           Navigator.pushNamed(context, routeName);
                //         },
                //         icon: "assets/icons/ask.svg",
                //         title: "الاقارب"),
                //     //
                //     LessonsCard(
                //         onPress: () {
                //           Navigator.pushNamed(context, routeName);
                //         },
                //         icon: "assets/icons/ask.svg",
                //         title: "الملابس"),
                //   ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
