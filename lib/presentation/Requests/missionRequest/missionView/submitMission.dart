
import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/model/user.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpSkills_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/qualification_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/grade_viewModel.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';

import 'package:http/http.dart' as http;


class EmployeeSkillsView extends StatefulWidget {
  const EmployeeSkillsView({Key? key}) : super(key: key);

  @override
  State<EmployeeSkillsView> createState() => _EmployeeSkillsViewState();
}

class _EmployeeSkillsViewState extends State<EmployeeSkillsView> {

  final DisplayEmpSkillsViewModel _displayViewModel = instance<
      DisplayEmpSkillsViewModel>();
  final EmployeeSkillsViewModel _saveviewModel = instance<
      EmployeeSkillsViewModel>();

  //EmployeeSkillsViewModel? _saveviewModel;
  final QualificationViewModel _QualificationviewModel = instance<
      QualificationViewModel>();
  final GradeViewModel _GradeviewModel = instance<GradeViewModel>();

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey = GlobalKey<FormState>();
  DateTime date = DateTime(2023);
  String? userId;
  final TextEditingController _DateEditingController = TextEditingController();
  final TextEditingController _GradeIdEditingController = TextEditingController();
  final TextEditingController _QualificationIdEditingController = TextEditingController();
  final TextEditingController _EmployeeIdEditingController = TextEditingController();

  int? qualificationid;
  int? gradeId;
  var datetext;
  int? empId;
  bool? allowEdit;
  bool? addingSuccess;
  List<UserSkills>? skillsUpdate;
  List<GradeItem>? gradeItems;
  List<QualificationItem>? QualificationItems;

  _blind() {
    _saveviewModel.start();
    _displayViewModel.start();
    _QualificationviewModel.start();
    _GradeviewModel.start();
    _DateEditingController.addListener(() {
      _saveviewModel.setDate(_DateEditingController.text);
    });
    _GradeIdEditingController.addListener(() {
      _saveviewModel.setGradeId(int.parse(_GradeIdEditingController.text));
    });
    _QualificationIdEditingController.addListener(() {
      _saveviewModel.setQualificationId(
          int.parse(_QualificationIdEditingController.text));
    });
    _EmployeeIdEditingController.addListener(() {
      _saveviewModel.setEmployeeId(
          int.parse(_EmployeeIdEditingController.text));
    });
  }

  @override
  void initState() {

    super.initState();
    _blind();
    setState(() {
      skillsUpdate;
    });
  }

  @override
  void dispose() {
    _displayViewModel.dispose();
    _saveviewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
          child: Builder(
              builder: (context) =>
                  Scaffold(
                    //appBar: buildAppBarMain(context),
                    // backgroundColor: colorManager.white,
                    body: StreamBuilder<FlowState>(
                      stream: _saveviewModel.outputState,
                      builder: (context, snapshot) {
                        return snapshot.data?.getScreenWidget(
                            context, _getContentWidget(),
                                () {
                              _saveviewModel.addSkills();
                            },
                                () {
                            }) ??
                            _getContentWidget();
                      },
                    ),
                  ))
      );
  }

  Widget _getContentWidget() {
    return
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 1.3,
                padding: const EdgeInsets.only(top: 5),
                child: SingleChildScrollView(
                  child: Form(
                    key: _Formkey,
                    child: Column(
                      children: [
                        // qualification
                        Container(
                            alignment: AlignmentDirectional.topStart,
                            padding: const EdgeInsets.only(
                                top: 12,
                                left: 28,
                                right: 28),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.Qualification.tr(),
                                    textAlign: TextAlign.start,),
                                  StreamBuilder<QualificationsObject>(
                                    stream: _QualificationviewModel
                                        .outputQualifications,
                                    // stream: _saveViewModel.outputErrorPassword,
                                    builder: (context, snapshot) {
                                      List<
                                          QualificationItem>? qualifications = snapshot
                                          .data?.qualifications;
                                      return _getQualification(
                                          qualifications);
                                    },
                                  ),
                                ])),
                        //Grade
                        Container(
                            alignment: AlignmentDirectional.topStart,
                            padding: const EdgeInsets.only(
                                top: 12,
                                left: 28,
                                right: 28),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.Grade.tr(), textAlign: TextAlign.start,),
                                  StreamBuilder<GradesObject>(
                                    stream: _GradeviewModel.outputGrades,
                                    // stream: _saveViewModel.outputErrorPassword,
                                    builder: (context, snapshot) {
                                      List<GradeItem>? grades = snapshot.data
                                          ?.grades;
                                      gradeItems=grades;
                                      return _getGrade(grades);
                                    },
                                  ),
                                ])),
                        //date
                        Container(
                          padding: const EdgeInsets.only(
                              top: 12,
                              left: 28,
                              right: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.Date.tr(), textAlign: TextAlign.start,),

                              TextFormField(onTap: () async {
                                DateTime? newDate =
                                await showDatePicker
                                  (context: context,
                                    initialDate: date,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100)
                                );
                                //if 'cancel'=>null
                                if (newDate == null) return;
                                //if 'ok' => DateTime
                                setState(() {
                                  date = newDate;
                                  datetext = date;
                                });
                              },
                                  keyboardType: TextInputType.text,
                                  controller: _DateEditingController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_month),
                                      hintText:
                                      date.day.toString() +
                                          "/" + date.month.toString() +
                                          "/" + date.year.toString()
                                    //labelText: AppStrings.nationalId.tr(),
                                    //errorText: snapshot.data
                                  ))
                              //  ),
                            ],
                          ),
                        ),
                        // save bottum
                        Container(
                            padding: EdgeInsets.all(20),
                            child: StreamBuilder<getEmpSkillsModel>(
                                stream: _displayViewModel.outputEmpSkill,
                                builder: (context, snapshot) {
                                  if (snapshot.data?.allowEdit == true) {
                                    return StatefulBuilder
                                      (builder: (context,setState)=>FloatingActionButton(
                                        child: Text(AppStrings.Add.tr()),
                                        onPressed: () async{
                                          //skillsUpdate=snapshot.data?.skills;

                                          await addingSkills();
                                          await generateSkillsData() ;

                                          setState(() {
                                            skillsUpdate=skillsUpdate;

                                          });
                                        }
                                      // : null,

                                    ));
                                  }
                                  return Container();
                                }

                            )
                        ),
                        //skills data table
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 30, 10, 30),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: StreamBuilder<getEmpSkillsModel>(
                                    stream: _displayViewModel.outputEmpSkill,
                                    // stream: _saveViewModel.outputErrorPassword,
                                    builder: (context, snapshot){
                                      allowEdit=snapshot.data?.allowEdit;
                                      List<skillsModel>? skills= snapshot
                                          .data
                                          ?.skills;

                                      return
                                        Skillstable();
                                    }


                                  // ))


                                )
                            ))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      );
  }
  Future<void> refrash()
  { return Future.delayed(const Duration(seconds: 1));

  }

  Widget _getQualification(List<QualificationItem>? qualification) {
    //var dropdownvalue;
    QualificationItems=qualification;
    var items = qualification?.map(
            (qualificationItem) {
          return DropdownMenuItem(
            value: qualificationItem.value,
            child: Text(qualificationItem.text.toString()),);
        }).toList();


    return DropdownButton(enableFeedback: allowEdit,
      hint: Text(AppStrings.Choose_a_Qualification.tr()),
      items: items,
      onChanged: (newvalue) {allowEdit! ?
      setState(() {
        qualificationid = newvalue;
      }):null;
      },
      value: qualificationid,
    );
  }


  String? gradeName(int gId){


    gradeItems?.map(
            (gradeItem) {
          if(gradeItem.value==gId){return gradeItem.text ;}
        }).toList();
    return null;
  }

  String? QualificationName(int QId){


    QualificationItems?.map(
            (qualificationItem) {
          if(qualificationItem.value==QId){return qualificationItem.text ;}
        }).toList();
    return null;
  }

  Widget _getGrade(List<GradeItem>? grade) {
    //var  dropdownvalue;
    var items = grade?.map(
            (gradeItem) {
          return DropdownMenuItem(

            value: gradeItem.value,
            child: Text(gradeItem.text.toString()),);
        }).toList();

    return DropdownButton(
      hint: Text(AppStrings.Choose_a_Grad.tr()),
      items: items,
      //enableFeedback: ,
      onChanged: (newvalue) {allowEdit! ?
      setState(() {
        gradeId = newvalue;
      }):null;
      },
      value: gradeId,
    );
  }
  Widget _createSkillsTable(List<UserSkills> skills) {
    if(skills.isEmpty==false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(skills),

      );
    }else
    {return Container();}
  }
  Future<Widget> _createSkillsTable1(List<UserSkills> skills) async{
    if(skills.isEmpty==false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(skills),

      );
    }else
    {return Container();}
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(AppStrings.Skill.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.Grade_Name.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.Date.tr(), style: TextStyle(color: colorManager.white),)),
    ];
  }

  List<DataRow> _createRows(List<UserSkills> skills) {
    return skills
        .map((skill) =>
        DataRow(cells: [
          DataCell(Text((skill.typeName).toString())),
          DataCell(Text((skill.gradeName).toString())),
          DataCell(Text((skill.date).toString()))
        ]))
        .toList();
  }
  Future addingSkills() async
  {
    userId = await _appPreferences.getUserToken();
    empId = await _appPreferences.getEmpIdToken();


    // string to uri
    var uri = Uri.parse(Constants.SaveEmpSkillsUrl);

    // create multipart request
    // var request = http.Request("POST", uri);

    var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8','userId':userId!},
        body: jsonEncode(<String,dynamic>{
          'Date': datetext.toString(),
          'GradeId': gradeId,
          'QualificationTypeId': qualificationid,
          'EmployeeId':empId!}));
    // check the status code for the result
    if (response.statusCode == 200) {
      var x= result.fromJson(jsonDecode(response.body)) ;
      bool y =x.isValid;
      if(y==true) {
        setState(() {

          // skillsUpdate!.add(skillsModel(empId, QualificationName(qualificationid!), gradeName(gradeId!), qualificationid, datetext, gradeId));
          addingSuccess=true;
          //skillsUpdate= await generateSkillsData();


        });

        displayDialoge();
        // print(response.body);
      }else
      { displayFaileDialoge();}
    } else {
      displayFaileDialoge();
      // print('Request failed with status: ${response.statusCode}.');
    }
  }
  Widget Skillstable(){
    return
      FutureBuilder(
          future:generateSkillsData(),
          builder:(context,snapshot)
          {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child:CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                if (addingSuccess!=false) {
                  return Center(
                      child:_createSkillsTable(skillsUpdate!)
                  );}
            }
            return Center(
                child:_createSkillsTable(skillsUpdate!)
            );
          }



      );
  }

  Widget? displayDialoge()
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: AppStrings.Alerts.tr(),
          contentText: AppStrings.Was_Saved_Successfully.tr(),
          positiveText:  AppStrings.confirm.tr(),
          onPositiveClick: () {
            Navigator.of(context).pop();
          },

        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
    return null;
  }

  Widget? displayFaileDialoge()
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: "",
          contentText: AppStrings.saving_Failed,
          positiveText: AppStrings.confirm.tr(),
          onPositiveClick: () {
            Navigator.of(context).pop();
          },

        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
    return null;
  }

  Future <List<UserSkills>?> generateSkillsData() async {
    List<UserSkills>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.GetEmpSkillsUrl), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});
    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData['skills']!=null) {
      var user_Skills = responseData['skills'] as List;
      a = await user_Skills.map((jsonData) =>
          UserSkills.fromJson(jsonData)).toList();
      List<UserSkills>? b = List<UserSkills>.from(a as Iterable);
      skillsUpdate = b;
      return skillsUpdate;
    } return null;
  }

}
class result {
  final bool isValid;
  final String message;

  const result({
    required this.isValid, required this.message});

  factory result.fromJson(Map<String, dynamic> json) {
    return result(
      isValid: json['IsValid'],
      message: json['Message'],
    );
  }


}
class UserSkills {
  final int id;
  final String typeName;
  final String gradeName;
  final int qualificationTypeId;
  final  String date;
  final int gradeId;

  UserSkills ({
    required this.id,
    required this.typeName,
    required this.gradeName,
    required this.qualificationTypeId,
    required this.date,
    required this.gradeId,
  });
  factory UserSkills.fromJson(Map<String, dynamic> json) {
    return UserSkills(
        id: json["Id"],
        typeName: json["TypeName"],
        gradeName: json["GradeName"],
        qualificationTypeId: json["QualificationTypeId"],
        date: json["Date"],
        gradeId: json["GradeId"]
    );
  }
}
