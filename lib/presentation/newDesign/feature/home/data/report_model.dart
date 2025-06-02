class ReportModel {
  final String? typeReport; //نوع التقرير سلفه - اجازة
  final String? nameReport; // عنوان الطلب
  final String? not;
  final bool? isRequestAdvance;
  final bool? isSickLeave;
  final bool? isCertified; //معتمده
  final bool? isUnderReview; //تحت التدقيق
  final bool? isRejected; //مرفوض
  final int? numberOfInstallments; //عدد الأقساط
  final int? amount;
  final String? dateRequest; //تاريخ الطلب
  final String? time;
  final String? alertType;
  final String? workShiftOne;
  final String? workShiftTwo;
  final String? duration;
  final String? appBarTitle;

  ReportModel(  {
    this.appBarTitle,
    this.typeReport,
    this.nameReport,
    this.not,
    this.isRequestAdvance,
    this.isSickLeave,
    this.isCertified,
    this.isUnderReview,
    this.isRejected,
    this.numberOfInstallments,
    this.amount,
    this.dateRequest,
    this.time,
    this.alertType,
    this.workShiftOne,
    this.workShiftTwo,
    this.duration,
  }); // الرصيد

  static List<ReportModel> listReport = [
    ReportModel(
      typeReport: "تقرير الطلبات",
      nameReport: "طلب سلفة",
      isRequestAdvance: true,
      isCertified: true,
      numberOfInstallments: 3,
      amount: 234,
      not: "تقبل الله منكم الحج وقد تم اعتماد الاجازة",
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "اجازة مرضية",
      isUnderReview: true,
      isSickLeave: true,
      numberOfInstallments: 2,
      amount: 20,
      dateRequest: " 30 ديسمبر 2023",
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
  ];
  static List<ReportModel> listManagement = [
    ReportModel(
      nameReport: "استقالة",
      isCertified: true,
      dateRequest: " 30 ديسمبر 2023",
    ),
    ReportModel(
      nameReport: "نقل",
      dateRequest: " 30 ديسمبر 2023",
      isUnderReview: true,
    ),
    ReportModel(
      nameReport: "ترقية",
      dateRequest: " 30 ديسمبر 2023",
      isRejected: true,
    ),
  ];


}