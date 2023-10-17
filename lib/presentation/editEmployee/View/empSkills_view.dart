
import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/displayEmpSkills_viewModel.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/qualification_viewModel.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/grade_viewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import '../../../application/app_prefs.dart';
import '../../common/state_renderer/state_render_impl.dart';
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
                            }) ??
                            _getContentWidget();
                      },
                    ),
                  ))
      );
  }

  // Widget _getTabWidget(){
  //   return
  //   SizedBox(
  //     height: 50,
  //     child: AppBar(
  //       bottom: const TabBar(
  //         tabs: [
  //           Tab(
  //             icon: Icon(Icons.account_box),text: "Basic Data"),
  //           Tab(
  //             icon: Icon(Icons.abc,),text: "Skills"),
  //         ],
  //       ),
  //     ),
  //   );
  // }
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
                padding: EdgeInsets.only(top: 30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _Formkey,
                    child: Container(
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
                              child: StreamBuilder<bool>(
                                  stream: _saveviewModel.outputDateValid,
                                  builder: (context, snapshot) {
                                    return ElevatedButton(
                                        child: Text(AppStrings.Add.tr()),
                                        onPressed: () {
                                         // _saveviewModel.addSkills();
                                          addingSkills();
                                        }
                                      // : null,

                                    );
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
                                      builder: (context, snapshot) {
                                        List<skillsModel>? skills = snapshot
                                            .data
                                            ?.skills;
                                        return _createSkillsTable(skills!);
                                      }
                                  )
                              ))
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      );
  }

  void dispose() {
    _saveviewModel.dispose();
    super.dispose();
  }

  Widget _getQualification(List<QualificationItem>? qualification) {
    //var dropdownvalue;
    var items = qualification?.map(
            (qualificationItem) {
          return DropdownMenuItem(
            value: qualificationItem.value,
            child: Text(qualificationItem.text.toString()),);
        }).toList();

    return DropdownButton(
      hint: Text(AppStrings.Choose_a_Qualification.tr()),
      items: items,
      onChanged: (newvalue) {
        setState(() {
          qualificationid = newvalue;
        });
      },
      value: qualificationid,
    );
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
      onChanged: (newvalue) {
        setState(() {
          gradeId = newvalue;
        });
      },
      value: gradeId,
    );
  }

  Widget _createSkillsTable(List<skillsModel> skills) {
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

  List<DataRow> _createRows(List<skillsModel> skills) {
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
        displayDialoge();
        Phoenix.rebirth(Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute) as BuildContext);
        print(response.body);
      }else
        { displayFaileDialoge();}
    } else {
      displayFaileDialoge();
      print('Request failed with status: ${response.statusCode}.');
    }
  }


Widget? displayDialoge()
{
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return ClassicGeneralDialogWidget(
        titleText: 'Information',
        contentText: 'added successfully',
        onPositiveClick: () {
          Navigator.of(context).pop();
        },

      );
    },
    animationType: DialogTransitionType.fade,
    curve: Curves.linear,
    duration: Duration(seconds: 1),
  );
}

  Widget? displayFaileDialoge()
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'warning',
          contentText: 'Save Failure',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },

        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
  }

    //

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

