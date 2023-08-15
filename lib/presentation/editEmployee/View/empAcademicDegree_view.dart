
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/displayEmpAcademicDegree_viewModel.dart';

import 'package:mohr_hr/presentation/editEmployee/ViewModel/qualification_viewModel.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/grade_viewModel.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/saveEmpAcademicDegree_ViewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import '../../../application/app_prefs.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../resources/strings_manager.dart';


class EmployeeAcademicDegreeView extends StatefulWidget {
  const EmployeeAcademicDegreeView({Key? key}) : super(key: key);

  @override
  State<EmployeeAcademicDegreeView> createState() => _EmployeeAcademicDegreeViewState();
}

class _EmployeeAcademicDegreeViewState extends State<EmployeeAcademicDegreeView> {

  final DisplayAcademicDegreeViewModel _displayViewModel=instance<DisplayAcademicDegreeViewModel>();
  final SaveAcademicDegreeViewModel _saveviewModel=instance<SaveAcademicDegreeViewModel>();

  final GradeViewModel _GradeviewModel = instance<GradeViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey= GlobalKey<FormState>();
  DateTime date= DateTime(2022);

  final TextEditingController _DateEditingController= TextEditingController();
  final TextEditingController _GradeIdEditingController=TextEditingController();
  final TextEditingController _QualificationIdEditingController=TextEditingController();
  final TextEditingController _EmployeeIdEditingController=TextEditingController();

  _blind() {
    _saveviewModel.start();
    _displayViewModel.start();
    _GradeviewModel.start();
    _DateEditingController.addListener(() {
      _saveviewModel.setDate(_DateEditingController.text);
    });
    _GradeIdEditingController.addListener(() {
      _saveviewModel.setGradeId(int.parse(_GradeIdEditingController.text));
    });

    _EmployeeIdEditingController.addListener(() {
      _saveviewModel.setEmployeeId(int.parse(_EmployeeIdEditingController.text));
    });
  }

  @override
  void initState()
  {
    _blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
          child: Builder(
              builder: (context) =>
                  Scaffold(
                    //appBar: buildAppBarMain(context),
                    backgroundColor: colorManager.white,
                    body: StreamBuilder<FlowState>(
                      stream: _saveviewModel.outputState,
                      builder: (context, snapshot) {
                        return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                                () {
                              _saveviewModel.addAcdemicDegree();
                            }) ??
                            _getContentWidget();
                      },
                    ),
                  ))
      );
  }

  Widget _getTabWidget(){
    return
      SizedBox(
        height: 50,
        child: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.account_box),text: AppStrings.BasicData),
              Tab(
                  icon: Icon(Icons.abc,),text: AppStrings.AcadmicDegree),
            ],
          ),
        ),
      );
  }

  Widget _getContentWidget() {
    return
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height*1.3,
                padding: EdgeInsets.only(top:30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _Formkey,
                    child: Container(
                      child: Column(
                        children: [
                          // // qualification
                          // Container(
                          //     alignment: AlignmentDirectional.topStart,
                          //     padding: const EdgeInsets.only(
                          //         top: 12,
                          //         left: 28,
                          //         right: 28),
                          //     child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //
                          //         ])),
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
                                    Text("Grade", textAlign: TextAlign.start,),
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
                                Text("Date", textAlign: TextAlign.start,),

                                TextFormField(onTap: () async {

                                  await showDatePicker
                                    (context: context,
                                      initialDate: date,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100)
                                  );
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
                          // Container(
                          //   padding: const EdgeInsets.only(
                          //       left: 28, right: 28),
                          //   child: StreamBuilder<String?>(
                          //     stream: _saveviewModel.outputErrorDate,
                          //     builder: (context, snapshot) {
                          //       return TextFormField(
                          //           keyboardType: TextInputType.text,
                          //           controller: _DateEditingController,
                          //           decoration: InputDecoration(
                          //               hintText: AppStrings.date.tr(),
                          //               labelText: AppStrings.date.tr(),
                          //               errorText: snapshot.data));
                          //     },
                          //   ),
                          // ),
                          // Container(
                          //     padding: const EdgeInsets.only(
                          //         left: 28, right: 28),
                          //     child: StreamBuilder<bool>(
                          //       //stream: _viewModel.outputIsAllInputsValid,
                          //       builder: (context, snapshot) {
                          //         return SizedBox(
                          //           width: double.infinity,
                          //           height:40,
                          //           child: ElevatedButton(
                          //
                          //                onPressed: () {
                          //                 _saveviewModel.addAcademicDegree();
                          //               },
                          //                  // : null,
                          //               child: const Text(AppStrings.addAcademicDegree).tr()),
                          //         );
                          //       },
                          //     )),


                          //Save bottun
                          // save bottum
                          Container(
                              padding: EdgeInsets.all(20),
                              child: StreamBuilder<bool>(
                                //stream: _saveViewModel.outputIsAllInputsValid,
                                  builder: (context, snapshot)
                                  {
                                    return ElevatedButton(
                                        child: Text("Save"),
                                        onPressed: () {
                                          _saveviewModel.addAcdemicDegree();
                                        }
                                      // : null,

                                    );
                                  }
                              )
                          ),
                          //academicDegree data table
                          Container(padding: EdgeInsets.fromLTRB(20,30,10,30),
                              child:SingleChildScrollView(scrollDirection: Axis.horizontal,
                                  child:StreamBuilder<getAcademicDegreeModel>(
                                      stream: _displayViewModel.outputAcademicDegree,
                                      // stream: _saveViewModel.outputErrorPassword,
                                      builder: (context, snapshot) {
                                        List<AcademicDegreeModel>? academicDegree = snapshot.data
                                            ?.academicDegree;
                                        return _createAcademicDegreeTable(academicDegree);
                                      }
                                  )
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
    _saveviewModel.dispose();
    super.dispose();
  }


  Widget _getQualification(List<QualificationItem>? qualification)
  {
    return DropdownButton(
      hint: Text("Choose a Qualification"),
      items: qualification?.map(
              (qualificationItems) {
            return DropdownMenuItem(
              child: Text(qualificationItems.text.toString()),
              value: qualificationItems.value,);
          }).toList(),
      onChanged: (Object? value) {
        //selectedValue = value as int;
      },

    );
  }

  Widget _getGrade(List<GradeItem>? grade)
  {

    return DropdownButton(
      value: 0,
      hint: Text("Choose a grade"),
      items: grade?.map(
              (gradeItems) {
            return DropdownMenuItem(
              //hint: Text("Choose an item"),
              child: Text(gradeItems.text.toString()),
              value: gradeItems.value,);
          }).toList(),
      onChanged: (Object? value) {
        //selectedValue = value as int;
      },

    );
  }

  DataTable _createAcademicDegreeTable(List<AcademicDegreeModel>? academicDegree) {
    return DataTable(

      columns: _createColumns(),
      rows: _createRows(academicDegree!),
    );
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text("AcademicDegree")),
      DataColumn(label: Text("Grade")),
      DataColumn(label: Text("Major")),
      DataColumn(label: Text("university")),
      DataColumn(label: Text("Date")),

    ];

  }
  List<DataRow> _createRows(List<AcademicDegreeModel> academicDegree) {
    return academicDegree
        .map((academicDegree) =>
        DataRow(cells: [
          // "Id": 5823,
          // "TypeName": "بكالوريوس",
          // "GradeName": "جيد جدا",
          // "AcademicDegreeTypeId": 1,
          // "DegreeDate": "2014/10/28",
          // "GradeId": 3,
          // "Major": "محاسبة",
          // "University": "عين شمس"
          DataCell(Text((academicDegree.typeName).toString())),
          DataCell(Text((academicDegree.gradeName).toString())),
          DataCell(Text((academicDegree.major).toString())),
          DataCell(Text((academicDegree.university).toString())),
          DataCell(Text((academicDegree.degreeDate).toString()))
        ]))
        .toList();
  }

}
