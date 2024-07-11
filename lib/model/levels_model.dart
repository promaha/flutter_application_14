import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Level1 {
  final String levelName;
  final VoidCallback onPress;
  final String icon;
  final String title;

  Level1({
    required this.levelName,
    required this.onPress,
    required this.icon,
    required this.title,
  });
}

List<Level1> Level1Data = [
  Level1(
      levelName: "المستوى الاول",
      onPress: () {
        Get.toNamed('PagesLessonsScreen');
      },
      icon: "assets/icons/ask.svg",
      title: 'الاحرف'),
  Level1(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الارقام'),
  Level1(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الالوان'),
  Level1(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الاقارب'),
  Level1(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الملابس'),
];

class Level2 {
  final String levelName;
  final VoidCallback onPress;
  final String icon;
  final String title;

  Level2({
    required this.levelName,
    required this.onPress,
    required this.icon,
    required this.title,
  });
}

List<Level2> Level2Data = [
  Level2(
      levelName: "المستوى الثاني",
      onPress: () {
        Get.toNamed('LettersScreen');
      },
      icon: "assets/icons/ask.svg",
      title: 'الاحرف'),
  Level2(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الارقام'),
  Level2(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الالوان'),
  Level2(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الاقارب'),
  Level2(
      levelName: "المستوى الاول",
      onPress: () {},
      icon: "assets/icons/ask.svg",
      title: 'الملابس'),
];
