import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:easy_localization/easy_localization.dart';
import '../resources/strings_manager.dart';

class EmployeeTypeAheadField extends StatefulWidget {
  final String date;
  final int typeId;
  final int type;
  final Function(EmployeeReviewers) onEmployeeSelected;

  const EmployeeTypeAheadField({
    super.key,
    required this.date,
    required this.typeId,
    required this.type,
    required this.onEmployeeSelected,
  });

  @override
  State<EmployeeTypeAheadField> createState() => _EmployeeTypeAheadFieldState();
}

class _EmployeeTypeAheadFieldState extends State<EmployeeTypeAheadField> {
  final TextEditingController _controller = TextEditingController();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;

  Future<List<EmployeeReviewers>> fetchReviewers(String pattern) async {
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
      return data
          .map<EmployeeReviewers>((e) => EmployeeReviewers.fromJson(e))
          .where((e) => e.name?.toLowerCase().contains(pattern.toLowerCase()) ?? false)
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<EmployeeReviewers>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 1.0),
          ),
          label: Text(AppStrings.Reviewers.tr()),
        ),
      ),
      suggestionsCallback: fetchReviewers,
      itemBuilder: (context, EmployeeReviewers suggestion) {
        return ListTile(
          title: Text(suggestion.name ?? ''),
          subtitle: Text(suggestion.code ?? ''),
        );
      },
      onSuggestionSelected: (EmployeeReviewers suggestion) {
        _controller.text = suggestion.name ?? '';
        widget.onEmployeeSelected(suggestion);
      },
      noItemsFoundBuilder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(AppStrings.noContent.tr()),
      ),
    );
  }
}
//
// String? selectedEmployeeName;
// String? selectedEmployeeCode;
// int? selectedEmployeeId;
//
// EmployeeTypeAheadField(
// date: '2025-05-14',
// typeId: 1,
// type: 2,
// onEmployeeSelected: (employee) {
// selectedEmployeeName = employee.name;
// selectedEmployeeCode = employee.code;
// selectedEmployeeId = employee.employeeId;
//
// print('Name: $selectedEmployeeName');
// print('Code: $selectedEmployeeCode');
// print('ID: $selectedEmployeeId');
// },
// ),
