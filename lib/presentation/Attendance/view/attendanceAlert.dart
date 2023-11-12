// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/Attendance/viewModel/attendViewModel.dart';
//import 'package:mohr_hr/presentation/Requests/Attendance/View/AttendanceDetailsDialog.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/widgets/appbar_widget.dart';
import 'package:mohr_hr/presentation/widgets/appbarstart.dart';
import 'package:mohr_hr/presentation/widgets/profile_widget.dart';
import '../../../../application/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//import '../ViewModel/AttendanceViewModel.dart';

class AttendanceAlertView extends StatefulWidget {
  const AttendanceAlertView({Key? key}) : super(key: key);

  @override
  State<AttendanceAlertView> createState() => _AttendanceAlertViewState();
}
final items=<Widget>
[ const Icon(Icons.person,size: 30,),
  const Icon(Icons.home,size: 30,),
  const Icon(Icons.notifications,size: 30,),

];

DateTime Fromdate = DateTime(2023);
DateTime Todate = DateTime(2023);
bool oKPressed=false;


late String _startDate, _endDate;
final DateRangePickerController _controller = DateRangePickerController();

String? userId;
final AppPreferences _appPreferences = instance<AppPreferences>();

final TextEditingController _FromDateEditingController = TextEditingController();
final TextEditingController _ToDateEditingController = TextEditingController();
class _AttendanceAlertViewState extends State<AttendanceAlertView> {
  final AttendanceViewModel _viewModel = instance<AttendanceViewModel>();

  @override
  void initState() {
    _bind();
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd-MM-yyyy').format(today).toString();
    _endDate = DateFormat('dd-MM-yyyy')
        .format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 1)));
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Image.asset("assets/images/44190-under-construction-1 (1).gif")
    );
  }

  }
