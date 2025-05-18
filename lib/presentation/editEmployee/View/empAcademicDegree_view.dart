
import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:flutter/material.dart';

import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/Degree_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpAcademicDegree_ViewModel.dart';
import 'package:http/http.dart' as http;

import 'package:essmohr/presentation/editEmployee/ViewModel/grade_viewModel.dart';

import 'package:essmohr/presentation/resources/colors.dart';
import '../../../application/app_prefs.dart';

import '../../resources/strings_manager.dart';


class AcademicDegreeView extends StatefulWidget {
  const AcademicDegreeView({Key? key}) : super(key: key);

  @override
  State<AcademicDegreeView> createState() => _AcademicDegreeViewState();
}

class _AcademicDegreeViewState extends State<AcademicDegreeView> {

  final DisplayAcademicDegreeViewModel _displayViewModel=instance<DisplayAcademicDegreeViewModel>();
  //final SaveAcademicDegreeViewModel _saveviewModel=instance<SaveAcademicDegreeViewModel>();

  final GradeViewModel _GradeviewModel = instance<GradeViewModel>();
  final DegreeViewModel _DegreeviewModel = instance<DegreeViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey= GlobalKey<FormState>();
  DateTime date= DateTime(2022);

  final TextEditingController _UniversityEditingController= TextEditingController();
  final TextEditingController _MajorEditingController= TextEditingController();
  final TextEditingController _NotesEditingController= TextEditingController();
  final TextEditingController _DateEditingController= TextEditingController();
  final TextEditingController _GradeIdEditingController=TextEditingController();
  //final TextEditingController _QualificationIdEditingController=TextEditingController();
  final TextEditingController _EmployeeIdEditingController=TextEditingController();
  int? gradeId;
  var datetext;
  int? acadmicId;
  String? major;
  String? notes;
  int? empId;
  String? userId;
  List<UserAcademicDegree>? academicDegree;
  bool? addingSuccess;
  _blind() {
   // _saveviewModel.start();
    _displayViewModel.start();
    _GradeviewModel.start();
    _DegreeviewModel.start();
    _DateEditingController.addListener(() {
     // _saveviewModel.setDate(_DateEditingController.text);
    });
    _GradeIdEditingController.addListener(() {
     // _saveviewModel.setGradeId(int.parse(_GradeIdEditingController.text));
    });

    _EmployeeIdEditingController.addListener(() {
      // _saveviewModel.setEmployeeId(
      //     int.parse(_EmployeeIdEditingController.text));
    });


  }

  @override
  void initState()
  {

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
                    //backgroundColor: colorManager.white,
                    body:
                    StreamBuilder<FlowState>(
                      stream: _displayViewModel.outputState,
                      builder: (context, snapshot) {
                        return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                                () {
                             // _saveviewModel.addAcdemicDegree();
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
                 width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*1.3,
                padding: EdgeInsets.only(top:30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _Formkey,
                    child: Container(
                      child: Column(
                        children: [
                        // AcademicDegree
                          Container(
                              alignment: AlignmentDirectional.topStart,
                              padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 28,
                                  right: 28),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppStrings.Academic_Degree.tr(), textAlign: TextAlign.start,),
                                    StreamBuilder<DegreeObject>(
                                      stream: _DegreeviewModel.outputDegrees,
                                      // stream: _saveViewModel.outputErrorPassword,
                                      builder: (context, snapshot) {
                                        List<DegreeItem>? degrees = snapshot.data?.Degrees;
                                        return _getAcademicDegree(degrees);
                                      },
                                    ),])),
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
                                        List<GradeItem>? grades = snapshot.data?.grades;
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
                                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                     Text(AppStrings.University_Faculty_Institute.tr(), textAlign: TextAlign.start,),

                                    TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: _UniversityEditingController,
                                        ),
                                   Text(AppStrings.Major.tr(), textAlign: TextAlign.start,),

                                   TextFormField(
                                     keyboardType: TextInputType.text,
                                     controller: _MajorEditingController,
                                   ),
                                   Text(AppStrings.Notes.tr(), textAlign: TextAlign.start,),

                                   TextFormField(
                                     keyboardType: TextInputType.text,
                                     controller: _NotesEditingController,
                                   ),
                                   Text(AppStrings.Date.tr(), textAlign: TextAlign.start,),
                                  // Text("Date", textAlign: TextAlign.start,),

                                   TextFormField(

                                       onTap: () async {

                                     DateTime? newDate=
                                     await showDatePicker
                                       (context: context,
                                         initialDate: date,
                                         firstDate: DateTime(1900),
                                         lastDate: DateTime(2100)
                                     );
                                     //if 'cancel'=>null
                                     if(newDate==null)return;
                                     //if 'ok' => DateTime
                                     setState(() {
                                       date=newDate;
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

                          //Save bottun
                                Container(
                              padding: EdgeInsets.all(20),
                                 child:
                                 StreamBuilder<getAcademicDegreeModel>(
                                stream: _displayViewModel.outputAcademicDegree,
                                  builder: (context, snapshot) {
                                    if (snapshot.data?.allowEdit == true) {
                                      return StatefulBuilder
                                        (builder: (context,setState)=>FloatingActionButton(
                                            child: Text(AppStrings.Add.tr()),
                                            onPressed: () async {
                                              await addingAcademicDegree();
                                              await generateAcademicDegreeData();
                                              setState(() {
                                                academicDegree=academicDegree;
                                              });
                                              // _saveviewModel.addAcdemicDegree();
                                            }
                                          // : null,

                                        ));
                                    }
                                    return Container();
                                  }
                                 )
                              ),
                         // ),
                          //academicDegree data table
                                Container(padding: EdgeInsets.fromLTRB(20,30,10,30),
                                    child:SingleChildScrollView(scrollDirection: Axis.horizontal,
                                  child:StreamBuilder<getAcademicDegreeModel>(
                                      stream: _displayViewModel.outputAcademicDegree,
                                      // stream: _saveViewModel.outputErrorPassword,
                                      builder: (context, snapshot) {
                                        List<AcademicDegreeModel>? academicDegree = snapshot
                                            .data
                                            ?.academicDegree;
                                        if (academicDegree != null) {
                                          return academicDegreeTable();
                                        }
                                        else {
                                          return Container();
                                        }
                                      })
                              ))],
                      ),
                    ),
                  ),
                )),
                ],
        ),
      );
  }


  void dispose(){
    //_saveviewModel.dispose();
    super.dispose();
  }


  Widget _getGrade(List<GradeItem>? grade)
  {//var  dropdownvalue;
    var items=grade?.map(
            (gradeItem) {
          return DropdownMenuItem(

            value: gradeItem.value,
            child: Text(gradeItem.text.toString()),);
        }).toList();

    return DropdownButton(
      hint: Text(AppStrings.Grade.tr()),
      items:  items,
      onChanged: (newvalue) {
        setState(() {
          gradeId = newvalue;
        });
      },
      value: gradeId,
    );
  }
  Widget _getAcademicDegree(List<DegreeItem>? degree)
  {
    var items=degree?.map(
            (degreeItem) {
          return DropdownMenuItem(

            value: degreeItem.value,
            child: Text(degreeItem.text.toString()),);
        }).toList();

    return DropdownButton(
      hint: Text(AppStrings.Choose_Academic_Degree.tr()),
      items:  items,
      onChanged: (newvalue) {
        setState(() {
          acadmicId = newvalue;
        });
      },
      value: acadmicId,
    );





    //var  dropdownvalue;
    // var items=<String>["Bachelor of","Bachelor","Master","PHD","Doblom"]
    // .map((acdemicItem) {
    //   return DropdownMenuItem(
    //     value: acdemicItem,
    //     child: Text(acdemicItem),
    //   );
    // }).toList();
    //
    //
    //
    // return DropdownButton(
    //   hint: Text("Choose Academic Degree"),
    //   items:  items,
    //   onChanged: (newvalue) {
    //     setState(() {
    //       acadmicId = newvalue;
    //     });
    //   },
    //   value: acadmicId ,
    // );
  }
  Widget _createAcademicDegreeTable(List<UserAcademicDegree> academicDegree) {
    if(academicDegree.isEmpty==false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(academicDegree),
      );
    }else {
      return Container();
    }
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text(AppStrings.Academic_Degree.tr())),
      DataColumn(label: Text(AppStrings.Grade.tr())),
      DataColumn(label: Text(AppStrings.Major.tr())),
      DataColumn(label: Text(AppStrings.University.tr())),
      DataColumn(label: Text(AppStrings.Date.tr())),

    ];

  }
  List<DataRow> _createRows(List<UserAcademicDegree> academicDegree) {
    return academicDegree
        .map((academicDegree) =>
        DataRow(cells: [
          DataCell(Text((academicDegree.typeName).toString())),
          DataCell(Text((academicDegree.gradeName).toString())),
          DataCell(Text((academicDegree.major).toString())),
          DataCell(Text((academicDegree.university).toString())),
          DataCell(Text((academicDegree.degreeDate).toString()))
        ]))
        .toList();
  }

  Future addingAcademicDegree() async
  {
    userId = await _appPreferences.getUserToken();
    empId = await _appPreferences.getEmpIdToken();
    String? major=_MajorEditingController.text;
    String? university=_UniversityEditingController.text;
    String? notes=_NotesEditingController.text;
    // string to uri
    var uri = Uri.parse(Constants.saveEmpAcademicDegree);

    // create multipart request
    // var request = http.Request("POST", uri);

    var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8','userId':userId!},
        body: jsonEncode(<String,dynamic>{
          'Major': major,
          'University':university,
          'Notes':notes,
          'EmployeeId':empId!,
          'AcademicDegreeTypeId':acadmicId,
          'GradeId': gradeId,

          }));
    // check the status code for the result
    if (response.statusCode == 200) {
      var x= result.fromJson(jsonDecode(response.body)) ;
      bool y =x.isValid;
      if(y==true) {
        displayDialoge(context);
        setState(() {

          addingSuccess=true;
        });
      }else
      { displayFaileDialoge(context);}
    } else {
      displayFaileDialoge(context);
      //print('Request failed with status: ${response.statusCode}.');
    }
  }

  Widget academicDegreeTable(){
    return
      FutureBuilder(
          future:generateAcademicDegreeData(),
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
                      child:_createAcademicDegreeTable(academicDegree!)
                  );}
            }
            return Center(
                child:_createAcademicDegreeTable(academicDegree!)
            );
          }



      );
  }


  void displayDialoge(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: AppStrings.Alerts.tr(),
      desc: AppStrings.Was_Saved_Successfully.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }

  void displayFaileDialoge(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: AppStrings.Alerts.tr(),
      desc: AppStrings.saving_Failed.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }

  Future <List<UserAcademicDegree>?> generateAcademicDegreeData() async {
    List<UserAcademicDegree>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.GetEmpAcademicDegree), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});
    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData['academicDegrees']!=null) {
      var user_academicDegrees = responseData['academicDegrees'] as List;
      a = await user_academicDegrees .map((jsonData) =>
          UserAcademicDegree.fromJson(jsonData)).toList();
      List<UserAcademicDegree>? b = List<UserAcademicDegree>.from(a as Iterable);
      academicDegree = b;
      return academicDegree;
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

class UserAcademicDegree{

  final int id;
  final String typeName;
  final String gradeName;
  final int academicDegreeTypeId;
  final String degreeDate;
  final int gradeId;
  final String  major;
  final String university;
  UserAcademicDegree({
    required this.id,
    required this.typeName,
    required this.gradeName,
    required this.academicDegreeTypeId,
    required this.degreeDate,
    required this.gradeId,
    required this.major,
    required this.university
  });

  factory UserAcademicDegree .fromJson(Map<String, dynamic> json) {
    return UserAcademicDegree(
        id: json["Id"],
        typeName: json["TypeName"],
        gradeName: json["GradeName"],
        academicDegreeTypeId: json["AcademicDegreeTypeId"],
        degreeDate: json["DegreeDate"],
        gradeId: json["GradeId"],
        major: json["Major"],
        university: json["University"]
    );
  }
}
