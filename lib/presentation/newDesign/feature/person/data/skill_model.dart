class EducationAndSkillModel{
  final String? title;
  final String ?date;
  final String ?degree;
 final bool? isEducation;

  EducationAndSkillModel({this.title, this.date, this.degree,this.isEducation=false});
  static List<EducationAndSkillModel>listSkill=[
    EducationAndSkillModel(title:"MultiTasking" ,date:"20 مايو 2024" ,degree: "Good",),
    EducationAndSkillModel(title:"English" ,date:"20 مايو 2024" ,degree: "Good",),
    EducationAndSkillModel(title:"ICDL" ,date:"20 مايو 2024" ,degree: "Good",),

  ];
  static List<EducationAndSkillModel>listEducation=[
    EducationAndSkillModel(title:"بكاليوريوس" ,date:"تطوير ويب" ,degree: "86%",isEducation: true),
    EducationAndSkillModel(title:"ماجستير" ,date:"تطوير ويب" ,isEducation: true),
    EducationAndSkillModel(title:"دكتوراه" ,date:"تطوير ويب" ,isEducation: true),
    EducationAndSkillModel(title:"دبلوم صناعى" ,date:"كهرباء" ,degree: "86%",isEducation: true),

  ];
}