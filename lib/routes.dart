import 'package:flutter/cupertino.dart';
import 'package:flutter_application_14/login_screen/login_screen.dart';
import 'package:flutter_application_14/screens/home_screen/home_screen.dart';
import 'package:flutter_application_14/screens/my_profile/my_profile.dart';
import 'package:flutter_application_14/screens/result_screen/result_screen.dart';
import 'package:flutter_application_14/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder> routs = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  MyProfileScreen.routeName: (context) => const MyProfileScreen(),
  ResultScreen.routeName: (context) => const ResultScreen(),
};
