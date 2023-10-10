
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/displayEmpAcademicDegree_ViewModel.dart';

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
  //final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey= GlobalKey<FormState>();
  DateTime date= DateTime(2022);
  String? dropdownValue;
  final TextEditingController _UniversityEditingController= TextEditingController();
  final TextEditingController _MajorEditingController= TextEditingController();
  final TextEditingController _NotesEditingController= TextEditingController();
  final TextEditingController _DateEditingController= TextEditingController();
  final TextEditingController _GradeIdEditingController=TextEditingController();
  final TextEditingController _QualificationIdEditingController=TextEditingController();
  final TextEditingController _EmployeeIdEditingController=TextEditingController();
  var gradeId;
  var datetext;
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
                 width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*1.3,
                padding: EdgeInsets.only(top:30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _Formkey,
                    child: Container(
                      child: Column(
                        children: [
                         //AcademicDegree
                          Container(
                              alignment: AlignmentDirectional.topStart,
                              padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 28,
                                  right: 28),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Academic Degree", textAlign: TextAlign.start,),
                                    _getAcademicDegree()])),
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
                                     Text("University/Faculty/Institute", textAlign: TextAlign.start,),

                                    TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: _UniversityEditingController,
                                        ),
                                   Text("Major", textAlign: TextAlign.start,),

                                   TextFormField(
                                     keyboardType: TextInputType.text,
                                     controller: _MajorEditingController,
                                   ),
                                   Text("Notes", textAlign: TextAlign.start,),

                                   TextFormField(
                                     keyboardType: TextInputType.text,
                                     controller: _NotesEditingController,
                                   )
                                //  ),
                              ],
                            ),
                          ),
                               Container(
                            padding: const EdgeInsets.only(
                                top: 12,
                                left: 28,
                                right: 28),
                                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                     Text("Date", textAlign: TextAlign.start,),

                                      TextFormField(onTap: () async {

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
                          // save bottum
                                Container(
                              padding: EdgeInsets.all(20),
                                 child: StreamBuilder<bool>(
                                stream: _saveviewModel.outputDateValid,
                                  builder: (context, snapshot)
                                  {
                                    return ElevatedButton(
                                        child: Text("Add"),
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
                                        if(academicDegree!=null) {
                                          return _createAcademicDegreeTable(
                                              academicDegree);
                                        }else{return Container();}
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


  Widget _getGrade(List<GradeItem>? grade)
  {//var  dropdownvalue;
    var items=grade?.map(
            (gradeItem) {
          return DropdownMenuItem(

            value: gradeItem.value,
            child: Text(gradeItem.text.toString()),);
        }).toList();

    return DropdownButton(
      hint: Text("Choose Grade"),
      items:  items,
      onChanged: (newvalue) {
        setState(() {
          gradeId = newvalue;
        });
      },
      value: gradeId,
    );
  }
  Widget _getAcademicDegree()
  {//var  dropdownvalue;
    var items=<String>["Bachelor of","Bachelor","Master","PHD","Doblom"]
    .map((acdemicItem) {
      return DropdownMenuItem(
        value: acdemicItem,
        child: Text(acdemicItem),
      );
    }).toList();



    return DropdownButton(
      hint: Text("Choose Academic Degree"),
      items:  items,
      onChanged: (newvalue) {
        setState(() {
          dropdownValue = newvalue;
        });
      },
      value: dropdownValue,
    );
  }
  DataTable _createAcademicDegreeTable(List<AcademicDegreeModel> academicDegree) {
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => colorManager.lightprimary),
      columns: _createColumns(),
      rows: _createRows(academicDegree),
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
          DataCell(Text((academicDegree.typeName).toString())),
          DataCell(Text((academicDegree.gradeName).toString())),
          DataCell(Text((academicDegree.major).toString())),
          DataCell(Text((academicDegree.university).toString())),
          DataCell(Text((academicDegree.degreeDate).toString()))
        ]))
        .toList();
  }

}
