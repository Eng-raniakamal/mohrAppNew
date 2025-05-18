import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:http/http.dart' as http;
import 'package:essmohr/domain/model/model.dart';

import '../resources/strings_manager.dart';

class ReviewerCheckboxList extends StatefulWidget {
  final String date;
  final int typeId;
  final int type;

  const ReviewerCheckboxList({
  super.key,
  required this.date,
  required this.typeId,
  required this.type,

  }) ;

  @override
  _ReviewerCheckboxListState createState() => _ReviewerCheckboxListState();
}

class _ReviewerCheckboxListState extends State<ReviewerCheckboxList> {
  late List<int> selectedIds;
  List<EmployeeReviewers> reviewers = [];
  Map<int, bool> selectedReviewers = {};
  final AppPreferences _appPreferences = instance<AppPreferences>();


  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await fetchReviewer();
  }

  Future<void> fetchReviewer() async {
    userId = await _appPreferences.getUserToken();
    String urlPath =
        '${Constants.employeeReviewers}${widget.date}&requestedTypeId=${widget.typeId}&requestType=${widget.type}';

    var response = await http.get(
      Uri.parse(urlPath),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId ?? ''
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        reviewers = data.map((e) => EmployeeReviewers.fromJson(e)).toList();
      });
    } else {
      // يمكنك عرض رسالة أو تسجيل الخطأ إن أردت
      setState(() {
        reviewers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviewers.length,
      itemBuilder: (context, index) {
        final emp = reviewers[index];
        return CheckboxListTile(
          value: selectedReviewers[emp.employeeId] ?? false,
          onChanged: (bool? selected) {
            setState(() {
              selectedReviewers[emp.employeeId!] = selected ?? false;
            });
          },
          title: Text(emp.name ?? ''),
          subtitle: Text("كود: ${emp.code}"),
          secondary: CircleAvatar(
            backgroundImage: NetworkImage('https://your_base_url${emp.picPath}'),
          ),
        );
      },
    );
  }
}
//calling the code
// EmployeeCheckboxList(
// employees: employeeList,
// initiallySelectedIds: [],
// baseImageUrl: 'https://yourserver.com', // تأكد من وضع الرابط الصحيح
// onSelectionChanged: (selectedEmployees) {
// // استخدام الموظفين المحددين
// print("تم اختيار: ${selectedEmployees.map((e) => e.name)}");
// },
// ),