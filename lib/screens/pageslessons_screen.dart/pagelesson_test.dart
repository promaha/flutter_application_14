class PageTest {
  late String img;
  late String choice1;
  late String choice2;
  late int choiceOneCorrectt;
  late int choiceTwoCorrectt;
  // late String text

  PageTest({
    required this.img,
    required this.choice1,
    required this.choice2,
    required this.choiceOneCorrectt,
    required this.choiceTwoCorrectt,
  });
}

List<PageTest> screensTest = <PageTest>[
  PageTest(
    img: "assets/images/ابن 00_00_00-00_00_30.gif",
    choice1: " ",
    choice2: " ",
    choiceOneCorrectt: 1,
    choiceTwoCorrectt: 0,
  ),
  PageTest(
    img: "assets/images/ابن 00_00_00-00_00_30.gif",
    choice1: " ",
    choice2: " ",
    choiceOneCorrectt: 1,
    choiceTwoCorrectt: 0,
  ),
  PageTest(
    img: "assets/images/ابن 00_00_00-00_00_30.gif",
    choice1: " ",
    choice2: " ",
    choiceOneCorrectt: 1,
    choiceTwoCorrectt: 0,
  ),
  PageTest(
    img: "assets/images/ابن 00_00_00-00_00_30.gif",
    choice1: " جد ",
    choice2: " عم",
    choiceOneCorrectt: 1,
    choiceTwoCorrectt: 0,
  ),
];
