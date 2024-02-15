class ResultData {
  late final String subjectName;
  late final int totalMarks;
  late final int obtaindMarks;
  late final String grade;

  ResultData(this.subjectName, this.totalMarks, this.obtaindMarks, this.grade);
}

List<ResultData> result = [
  ResultData("المستوى الأول", 100, 90, 'A'),
  ResultData("المستوى الثاني", 89, 80, 'B'),
  ResultData("المستوى الثالث", 100, 50, 'D'),
  ResultData("المستوى الثالث", 100, 50, 'D'),
  ResultData("المستوى الثالث", 100, 50, 'D'),
  ResultData("المستوى الثالث", 100, 50, 'D'),
  ResultData("المستوى الثالث", 100, 50, 'D'),
  ResultData("المستوى الثالث", 100, 50, 'D'),
];
