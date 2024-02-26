import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/login_screen/login_screen.dart';
import 'package:flutter_application_14/screens/onboard/onboard.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, OnBoardScreen.routeName, (route) => false);
    });
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "اشارة ",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 50.0,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2.0,
                    ),
              ),
              Text(
                "طريقك الامثل للتعلم ",
                style: GoogleFonts.pattaya(
                  color: kTextWhiteColor,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  // letterSpacing: 2.0,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/splash.png",
            height: 150,
            width: 150,
          )
        ],
      ),
    );
  }
}
