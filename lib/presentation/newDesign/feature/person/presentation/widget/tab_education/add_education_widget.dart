import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/education_page/education_cubit.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/constants.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../../editEmployee/View/empAcademicDegree_view.dart';
import '../../../../../../editEmployee/ViewModel/Degree_viewModel.dart';
import '../../../../../../editEmployee/ViewModel/grade_viewModel.dart';
import '../../../../../../resources/strings_manager.dart';
import '../../../../../core/component/custom_elevated_button_widget.dart';
import '../../../../../core/component/input_date_day_widget.dart';

import '../tab_info_data/input_data_widget.dart';
import 'package:http/http.dart' as http;

class AddEducationWidget extends StatefulWidget {
  AddEducationWidget({super.key});

  @override
  State<AddEducationWidget> createState() => _AddEducationWidgetState();
}

class _AddEducationWidgetState extends State<AddEducationWidget> {
  final TextEditingController nameUnvController = TextEditingController();

  final TextEditingController filedEduController = TextEditingController();

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
  Widget build(BuildContext context)
  {
        return _getContentWidget();
  }
  Widget _getContentWidget() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<EducationPageCubit>(context as BuildContext).changePage(0);
              },
              child: Container(
                padding: EdgeInsets.all(8).r,
                color: Color(0xffF2F5F9),
                child: Icon(Icons.close),
              ),
            ),
            SizedBox(width: 12.w),
            Text("اضافة درجة علمية", style: AppTextStyle.iBMP24w600),
          ],
        ),
        SizedBox(height: 8.h),
        StreamBuilder<DegreeObject>(
          stream: _DegreeviewModel.outputDegrees,
          // stream: _saveViewModel.outputErrorPassword,
          builder: (context, snapshot) {
            List<DegreeItem>? degrees = snapshot.data?.Degrees;
            return _getAcademicDegree(degrees);
          },
        ),
        SizedBox(height: 16.h),
        StreamBuilder<GradesObject>(
          stream: _GradeviewModel.outputGrades,
          // stream: _saveViewModel.outputErrorPassword,
          builder: (context, snapshot) {
            List<GradeItem>? grades = snapshot.data?.grades;
            return _getGrade(grades);
          },
        ),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "جامعة/معهد",
          hint: "اكتب اسم الجامعة/ المعهد",
          controller: nameUnvController, readOnly: null,
        ),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "التخصص",
          hint: "اكتب اسم التخصص",
          controller: filedEduController, readOnly: null,
        ),
        SizedBox(height: 16.h),
        InputDateDayWidget(
          data: "التاريخ",
        ),
        SizedBox(height: 16.h),

        SizedBox(height: 44.h),
        CustomElevatedButtonWidget(data: "حفظ",onPressed: (){
          addingAcademicDegree();
          BlocProvider.of<EducationPageCubit>(context as BuildContext).changePage(0);
        },)
      ],
    );
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
       // displayDialoge();
        setState(() {

          addingSuccess=true;
        });
      }else
      {
        displayFaileDialoge(Context as BuildContext);
      }
    } else {
      displayFaileDialoge(Context as BuildContext);
      //print('Request failed with status: ${response.statusCode}.');
    }
  }
  void displayDialoge(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: AppStrings.alerts.tr(),
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
      title: AppStrings.alerts.tr(),
      desc: AppStrings.saving_Failed.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }

}

