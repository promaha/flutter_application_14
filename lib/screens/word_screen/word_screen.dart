import 'package:flutter/material.dart';

class WordsScreen extends StatelessWidget {
  WordsScreen({super.key});
  static String routeName = 'WordsScreen';

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
                  title: Text('الأعداد',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  // subtitle: Text('الأرقام',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .titleMedium
                  //         ?.copyWith(color: Colors.white54)),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            height: 500,
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20))),
              child: Image(
                image: AssetImage("assets/images/etegahat.gif"),
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),

      // body: Center(
      //   child: Image(
      //     image: AssetImage("assets/images/etegahat.gif"),
      //     width: 20,
      //     height: 20,
      //   ),
      // ),
      // backgroundColor: kOtherColor,
    );
  }
}
