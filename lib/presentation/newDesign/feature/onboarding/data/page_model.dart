class PageModel{
  final String image;
  final String title;
  final String desc;

  PageModel({required this.image, required this.title, required this.desc});
  static final List<PageModel> pages = [
    PageModel(
      image: "assets/images/NewDesign/image/onboarding/onb1.png",
      title: "مرحبًا بك في مهر",
      desc: "يسمح التطبيق للمسؤولين بتخزين وإدارة معلومات شاملة عن الموظفين مثل الاسم وتاريخ الميلاد",
    ),
    PageModel(
      image: "assets/images/NewDesign/image/onboarding/onb2.png",
      title: "مرحبًا بك في مهر",
      desc: "يسمح التطبيق للمسؤولين بتخزين وإدارة معلومات شاملة عن الموظفين مثل الاسم وتاريخ الميلاد",
    ),
    PageModel(
      image: "assets/images/NewDesign/image/onboarding/onb3.png",
      title: "مرحبًا بك في مهر",
      desc: "يسمح التطبيق للمسؤولين بتخزين وإدارة معلومات شاملة عن الموظفين مثل الاسم وتاريخ الميلاد",
    ) ,
  ];
}