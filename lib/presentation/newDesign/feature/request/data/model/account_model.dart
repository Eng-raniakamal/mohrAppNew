class AccountModel {
  final String? title;
  final String? name;
  final String? value;
  final bool? isCertified; //معتمده
  final bool? isUnderReview; //تحت التدقيق
  final bool? isRejected; //مرفوض

  AccountModel({
    this.isCertified,
    this.isUnderReview,
    this.isRejected,
    this.title,
    this.name,
    this.value,
  });

  static List<AccountModel> accountList = [
    AccountModel(title: "الاول", name: "محمد طارق", isCertified: true),
    AccountModel(title: "الثانى", name: "محمود عاكف", isUnderReview: true),
  ];
}
