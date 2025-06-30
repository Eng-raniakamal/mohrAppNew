import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/constants.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../../editEmployee/View/empAcademicDegree_view.dart';
import '../../../../../../editEmployee/ViewModel/displayEmpAcademicDegree_ViewModel.dart';
import '../../../../../../resources/strings_manager.dart';
import '../../../../../core/utils/app_message.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class ItemEducationWidget extends StatefulWidget {
  ItemEducationWidget({Key? key}) : super(key: key);



//  static  const IconData _moreVertRounded = IconData(0xf8dc, fontFamily: 'MaterialIcons',);

  @override
  State<ItemEducationWidget> createState() => _ItemEducationWidgetState();
}

class _ItemEducationWidgetState extends State<ItemEducationWidget> {
  List<UserAcademicDegree>? academicDegree;

  bool? allowEdit;

  bool? getAllowEdit(){ return allowEdit;}
  final DisplayAcademicDegreeViewModel _displayViewModel=instance<DisplayAcademicDegreeViewModel>();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  var EducationModel;

  String? userId;


  @override
  void initState()
  {
    _displayViewModel.start();
    super.initState();

  }



  //final EducationAndEducationModel EducationModel;
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.fromLTRB(20, 30, 10, 30),
        child: SingleChildScrollView(scrollDirection: Axis.horizontal,
            child: StreamBuilder<getAcademicDegreeModel>(
                stream: _displayViewModel.outputAcademicDegree,
                // stream: _saveViewModel.outputErrorPassword,
                builder: (context, snapshot) {
                  List<AcademicDegreeModel>? academicDegree = snapshot
                      .data
                      ?.academicDegree;
                 allowEdit= snapshot.data?.allowEdit;
                 Constants.allowEdit=allowEdit!;
                  if (academicDegree != null) {

                    return academicDegreeTable();
                  }
                  else {
                    return Container();
                  }
                })
        ));
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

  Widget academicDegreeTable(){
    return
      FutureBuilder(
          future:generateAcademicDegreeData(),
          builder:(context,snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return Center(
                      child: _createAcademicDegreeTable(academicDegree!));
            }
          });




  }

Widget _createAcademicDegreeTable(List<UserAcademicDegree> academicDegree) {
  if(academicDegree.isEmpty==false) {
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) =>
      AppColor.lightBlueBg),
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

}