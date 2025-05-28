class EarningOrDeductionsModel{
  final String?label;
  final String?value;

  EarningOrDeductionsModel({this.label, this.value});
  static final List<EarningOrDeductionsModel> earnings = [
    EarningOrDeductionsModel(label: 'فترة عمل الموظف',value: '25'),
    EarningOrDeductionsModel(label: 'فترة عمل الموظف', value: '25'),
    EarningOrDeductionsModel(label: 'المرتب الاساسى', value: '12500'),
    EarningOrDeductionsModel(label: 'مكافأة', value: '1000'),
    EarningOrDeductionsModel(label: 'اضافى', value: '1500'),
  ];

  static final List<EarningOrDeductionsModel> deductions = [
    EarningOrDeductionsModel(label: 'التأمينات الاجتماعية', value: '700'),
    EarningOrDeductionsModel(label: 'تأمين ضد الحوادث', value: '300'),
    EarningOrDeductionsModel(label: 'بوابة الموظف', value: '50'),
    EarningOrDeductionsModel(label: 'صندوق الزمالة', value: '100'),
  ];
}