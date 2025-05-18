import 'dart:convert';
import 'dart:core';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:http/http.dart' as http;

class ReviewAdmin extends StatefulWidget implements NavigationStates
{
  const ReviewAdmin ({Key? key}) : super(key: key);
  @override
  State<ReviewAdmin> createState() => _ReviewAdminiewState();


}

class _ReviewAdminiewState extends State<ReviewAdmin>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<ReviewAdminModel>? AdminsData;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
        child: Builder(
          builder: (context) =>
              Scaffold(
                // appBar: buildAppBarstart(context),
                // backgroundColor: colorManager.white,
                body:
                SingleChildScrollView(
                  child: Column(
                      children: [
                        Form(
                          child: Container(
                              padding: const EdgeInsets.only(
                                //top: 12,
                                  left: 28,
                                  right: 28),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start
                                  , children: [
                                const SizedBox(height: 30),
                                AdminTable()

                              ]
                              )
                          ),
                        )

                      ]),
                ),
              ),
        ),
      );
  }

  Widget AdminTable(){
    return
      FutureBuilder(
          future:getReviewAdminRequests(),
          builder:(context,snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Center(
                        child: _createAdminsTable(AdminsData!)
                    ),
                  );
            }
          });
  }

  Widget _createAdminsTable(List<ReviewAdminModel> Admin) {
    if(Admin.isEmpty==false) {
      return DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(Admin),

      );
    }else
    {return Text(AppStrings.noContent.tr());}
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(AppStrings.employee.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.empCode.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.date.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.empDepartment.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.jobTitle.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.from.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.to.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.period.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.Reviewers.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.attachments.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.notes.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.decision.tr(), style: TextStyle(color: colorManager.white),)),

    ];
  }

  List<DataRow> _createRows(List<ReviewAdminModel> Admin) {

    return Admin
        .map((Admin) =>
        DataRow(cells: [

          DataCell(Text((Admin.empName).toString())),
          DataCell(Text((Admin.empCode).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(Admin.date
          !)!).toString()),
          ])),
          DataCell(Text((Admin.empDepartment).toString())),
          DataCell(Text((Admin.jobTitle).toString())),
          DataCell(Text((Admin.value).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: reviewersList(Admin.reviewers))),
          DataCell(Text((Admin.attachments).toString())),
          DataCell(Text((Admin.notes).toString())),
          DataCell(Text((Admin.status).toString())),
        ]))
        .toList();
  }
  List<Widget> reviewersList(List<dynamic> items) {
    return items.map((item) {
      final value = item["Name"] ?? '';
      return
        Text((value).toString());
    }).toList();

  }
  Future <List<ReviewAdminModel>?> getReviewAdminRequests() async {
    List<ReviewAdminModel>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.getReviewAdmin), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});

    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData!=null) {
      var Admins = responseData as List;
      a = (Admins.map((jsonData) =>
          ReviewAdminModel.fromJson(jsonData)).toList());
         List<ReviewAdminModel>? b = List<ReviewAdminModel>.from(a as Iterable);
      AdminsData = b;
      return AdminsData;
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
