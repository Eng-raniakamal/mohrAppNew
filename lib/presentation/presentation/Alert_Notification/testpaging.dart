import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'dart:convert';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';


class NotificationModel {
  int? id;
  String? date;
  String? title;
  String? details;
  String? notes;
  String? attachments;
  bool? isCanceled;
  bool? seen;
  String? cancellationReason;
  int? employeeId;
  String? name;
  String? executionDate;
  double? value;

  NotificationModel({ this.id,
    this.date,
    this.title,
    this.details,
    this.notes,
    this.attachments,
    this.isCanceled, required this.seen,
    this.cancellationReason,
    this.employeeId,
    this.name,
    this.executionDate,
    this.value,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        id: json["Id"],
        date: json["Date"],
        title: json["Title"],
        details: json["Details"],
        notes: json["Notes"],
        attachments: json["attachments"],
        isCanceled: json["IsCanceled"],
        seen: json["Seen"],
        cancellationReason: json["CancellationReason"],
        employeeId: json["EmployeeId"],
        name: json["Name"],
        executionDate: json["ExecutionDate"],
        value: json["Value"]

    );
  }
}

class PaginatedDataTableView extends StatefulWidget {
  const PaginatedDataTableView({super.key});

  @override
  State<PaginatedDataTableView> createState() => _PaginatedDataTableViewState();
}

class _PaginatedDataTableViewState extends State<PaginatedDataTableView> {
  int _currentPage = 1;
  int _pageSize = 10;
  List<NotificationModel> _data = [];
  bool _isLoading = false;
  List<NotificationModel>? notifications;
  String? userId;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getNotificationUrl);
    List<NotificationModel>? a;

    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId!
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userNotifications = responseData as List;
      a = userNotifications.map((data) => NotificationModel.fromJson(data)).toList();
      notifications = List<NotificationModel>.from(a as Iterable);
      if(notifications !=null) {
       // await getUnseenNotificationId(notifications!);
      }
      //return notifications;

   // return null;
 // }
    //userId = await _appPreferences.getUserToken();
    // var uri = Uri.parse(Constants.getNotificationUrl);
    // List<NotificationModel>? a;
    // final response = await http.get(Uri.parse(
    //     '${Constants.getNotificationUrl}?page=$_currentPage')); //&pageSize=$_pageSize

    // if (response.statusCode == 200) {
    //   final jsonData = json.decode(response.body);
    //   inspect(jsonData);
    //   final dataList = jsonData['data']['users'] as List<dynamic>;
    //
    //   final List<NotificationModel> newData =
    //   dataList.map((item) => NotificationModel.fromJson(item)).toList();

      setState(() {
        _data.addAll(a!);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to fetch data');
    }
  }

  void _loadMoreData() {
    if (!_isLoading) {
      setState(() {
        _currentPage++;
      });
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  // title: const Text('Data Table'),
      // ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: PaginatedDataTable(
            //header: const Text('Data Table Header'),
            rowsPerPage: _pageSize,
            availableRowsPerPage: [10, 25, 50],
            onRowsPerPageChanged: (value) {
              setState(() {
                _pageSize = value!;
              });
            },columns:  [
              DataColumn(
                  label: Text("Date", style: TextStyle(color: colorManager.primary),)),
              DataColumn(label: Text(
                "Title", style: TextStyle(color: colorManager.primary),)),
              DataColumn(
                  label: Text(AppStrings.details.tr(), style: TextStyle(color: colorManager.primary),)),
              DataColumn(label: Text(
                "Notes", style: TextStyle(color: colorManager.primary),)),
              DataColumn(
                  label: Text("Attachments", style: TextStyle(color: colorManager.primary),)),
              DataColumn(label: Text(
                "Canceled", style: TextStyle(color: colorManager.primary),)),
              DataColumn(
                  label: Text("Cancellation Reason", style: TextStyle(color: colorManager.primary),)),
              DataColumn(label: Text(
                "Seen", style: TextStyle(color: colorManager.primary),)),
              ],
            source: _DataSource(data: _data),
          ),
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<NotificationModel> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];
    return  DataRow(cells: [
      DataCell(Text(_formatingDate(item.date).toString())),
      DataCell(Text((item.title).toString())),
      DataCell(Text(_textHandling(item.details).toString())),
      DataCell(Text(_textHandling(item.notes).toString())),
      DataCell(Text(_textHandling(item.attachments).toString())),
      // DataCell(_boolHandling(notificationItem.isCanceled)),
      DataCell(item.isCanceled == true ?
      Icon(Icons.check):Text("_")),
      DataCell(Text(_textHandling(item.cancellationReason).toString())),
      DataCell(item.seen == true ?
      Icon(Icons.check_box,color: Colors.blue,):Icon(Icons.close,color: Colors.grey))


      //DataCell(_boolHandling(notificationItem.seen)),

    ]);
  }
  String _textHandling(String? text)
  {
    String txtResult;
    if(text==null) {
      txtResult="";
      return txtResult;
    }
    txtResult=text;
    return txtResult;
  }
  String? _formatingDate(String? date)
  {
    if(date!=null){
      String? formatingDate = date.split('T').first;
      return formatingDate;}
    return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  //int get rowCount => data.length;
  int get rowCount =>data.length;
  @override
  int get selectedRowCount => 0;
}