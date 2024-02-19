import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';

class OnboardModel {
  late String img;
  late String text;
  late String desc;
  late Color bg;
  late Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
      img: "assets/images/skip1.jpeg",
      text: "ما هي لغة الاشارة؟",
      desc:
          "هي اللغة التي تُستخدم بطريقة مرئية أو الحركة اليدوية لتوصيل المعنى وهي لغة غير مسموعة .",
      bg: kOtherColor,
      button: kPrimaryColor),
  OnboardModel(
      img: "assets/images/skip1.jpeg",
      text: "لمحة تاريخية عن لغة الاشارة:",
      desc:
          "تعتبر لغة الإشارة واحدة من أهم اللغات العالمية الشيّقة، و قد أثبتت الدراسات أنّ الصمم نوعان أحداهما ( صمم خُلقي ) و الآخر ( صمم عرضي وقتي ) "
          "الأول يحدث منذُ الولادة لأسباب خُلقية وراثية و غيرها ، و الآخر صمم مكتسب  كتعرض لحادث أو شرب العقاقير أو كالشيخوخة   ",
      bg: kOtherColor,
      button: kPrimaryColor),
  OnboardModel(
      img: "assets/images/skip1.jpeg",
      text: "أمور يجب مراعاتها أثناء استخدام لغة الإشارة : ",
      desc:
          "1-يتوجب عليك مواجهة الشخص الاصم وجها لوجه وتكون الاشارة واضحة له بشكل كبير . \n"
          "2-	لابد أن تكون مرحا وقم بتوضيح المقصد دون مبالغة .\n"
          "3-	قم باستخدام اليد والجسد والشفاه لإيصال المطلوب منك ، حيث أن الاصم يقوم بالجمع بين كل ما سبق  للفهم ."
      // "4-	ولكي تجذب انتباه الاصم كل ما عليك فقط هو النقر على كتفه ببساطة مع ضرورة عدم قطع حديث له ."
      // "5- لا تطل الجمل حيث أن الاصم يمل بسرعة مع ضرورة اعطاؤه مجمل الحديث في أقل وقت."
      // "6-	ضرورة الطلب منه معاودة كلامه مرة أخرى في حالة عدم فهم الحديث ."
      // "7-	ضرورة ربط الإشارة مع مفهوم الكلام الخاص ،وعدم ارباك الاصم فيصبح غير قادر على التواصل.",
      ,
      bg: kOtherColor,
      button: kPrimaryColor),
  OnboardModel(
      img: "assets/images/skip1.jpeg",
      text: "ما هو تطبيق اشارة:",
      desc:
          ".يحتوي البرنامج على ثمانية مستويات يتضمن كل مستوى على أحرف وأرقام وكلمات وبعض الجمل الشائعة وغيرها وكذلك الأنشطة والاختبارات عند إكمالك جميع المستويات ستتمكن من التخاطب مع فئة الصم والبكم بكل سهولة إضافة الى الحصول على شهادة دبلوم معتمدة من قبل جمعية الصم والبكم",
      bg: kOtherColor,
      button: kPrimaryColor),
];
