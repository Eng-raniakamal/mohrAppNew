class SalaryWidgetModel {
  String? date;
  String? money;

  SalaryWidgetModel({this.date, this.money});

  static List<SalaryWidgetModel> salaryList = [
    SalaryWidgetModel(date: "يونيو 2024", money: "34,0845158"),
    SalaryWidgetModel(date: "مايو 2024", money: "36,0845158"),
    SalaryWidgetModel(date: "ابريل 2024", money: "36,0845158"),
  ];
}
