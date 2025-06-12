import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_date_day_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/model/user.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpSkills_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/qualification_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/grade_viewModel.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/constants.dart';
import '../../../../../../common/state_renderer/state_render_impl.dart';
import '../../../../../../editEmployee/View/empSkills_view.dart';
import '../../../../../../resources/strings_manager.dart';




class AddSkillWidget extends StatefulWidget {
  AddSkillWidget({super.key});

  @override
  State<AddSkillWidget> createState() => _AddSkillWidgetState();
}

class _AddSkillWidgetState extends State<AddSkillWidget> {
  final TextEditingController skillController = TextEditingController();

  final TextEditingController degreeSkillController = TextEditingController();

  final EmployeeSkillsViewModel _saveviewModel = instance<
      EmployeeSkillsViewModel>();

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
    // setState(() {
    //   skillsUpdate;
    // });
  }

  @override
  void dispose() {
    //_displayViewModel.dispose();
    _saveviewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      // Builder(
      //   builder: (context) =>
      //       Scaffold(
      //         body: StreamBuilder<FlowState>(
      //           stream: _saveviewModel.outputState,
      //           builder: (context, snapshot) {
      //             return snapshot.data?.getScreenWidget(
      //                 context, _getContentWidget(),
      //                     () {
      //                   _saveviewModel.addSkills();
      //                 },
      //                     () {
      //                 }) ??
                      _getContentWidget();
                }

  Widget _getContentWidget() {
    return

      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 12.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<SkillPageCubit>(context).changePage(0);
                },
                child: Container(
                  padding: EdgeInsets.all(8).r,
                  color: Color(0xffF2F5F9),
                  child: Icon(Icons.close),
                ),
              ),
              SizedBox(width: 12.w),
              Text("اضافة مهارة جديدة", style: AppTextStyle.iBMP24w600),
            ],
          ),
          SizedBox(height: 8.h),

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
          // InputDataWidget(
          //   title: "المهارة",
          //   hint: "اختر المهارة",
          //   controller: skillController,
          // ),
          SizedBox(height: 16.h),

          // InputDataWidget(
          //   title: "الدرجة",
          //   hint: "اختر المهارة",
          //   controller: degreeSkillController,
          // ),
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
          SizedBox(height: 16.h),
          InputDateDayWidget(
            data: "التاريخ",

          ),
          SizedBox(height: 44.h),
          CustomElevatedButtonWidget(data: "حفظ",onPressed: () async {
            await addingSkills();
            BlocProvider.of<SkillPageCubit>(context).changePage(0);
          },)
        ],
            ),
     // )
        //)

    //])
      );
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

  Future addingSkills() async {
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

        //displayDialoge(context);
        // print(response.body);
      }else
      {
        //displayFaileDialoge(context);
      }
    } else {
      //displayFaileDialoge(context);
      // print('Request failed with status: ${response.statusCode}.');
    }
  }

}

