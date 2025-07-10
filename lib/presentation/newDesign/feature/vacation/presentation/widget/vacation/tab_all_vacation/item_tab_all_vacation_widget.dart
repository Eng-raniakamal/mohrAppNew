
import 'dart:convert';

import 'package:essmohr/presentation/newDesign/core/model/status_model.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/number_of_request_advance_and_sick_leave.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/opening_time_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/text_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/item_of_from_to_widget.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../../application/app_prefs.dart';
import '../../../../../../../../application/constants.dart';
import '../../../../../../../../application/di.dart';
import '../../../../../../../../domain/model/model.dart';
import '../../../../../../core/component/custom_status_widget.dart';
import '../../../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

// class ItemTabAllVacationWidget extends StatelessWidget {
//   final GetEmployeeVacationsResponseModel employeeVacationsModel;
//   final List<VacationTypeBalancs>? vacationBalances;
//
//   const ItemTabAllVacationWidget({
//     super.key,
//     required this.employeeVacationsModel,
//     required this.vacationBalances,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     String vacationTypeName = employeeVacationsModel.vacationTypeName.toString();
//     String duration = "${employeeVacationsModel.duration ?? "10"}";
//
//     final consumed = getConsumedForTypeName(vacationTypeName);
//     final available = getAvailableForTypeName(vacationTypeName);
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 12).r,
//           padding: EdgeInsets.all(12).r,
//           decoration: BoxDecoration(
//             color: context.color.surface,
//             borderRadius: BorderRadius.circular(12).r,
//             border: Border.all(color: AppColor.black12, width: 1.w),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     employeeVacationsModel.vacationTypeName ?? "",
//                     style: context.text.titleMedium!.copyWith(
//                       color: context.color.onSurface,
//                     ),
//                   ),
//                   SizedBox(width: 8.w),
//                   getStatusText(employeeVacationsModel.status),
//                   Spacer(),
//                   OpeningTimeWidget(
//                     title: employeeVacationsModel.fromDate!.substring(0, 10) ?? " ",
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12.h),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 8).r,
//                 decoration: BoxDecoration(
//                   color: AppColor.lightBlueBg,
//                   borderRadius: BorderRadius.circular(8).r,
//                 ),
//                 child: Row(
//                   children: [
//                     SvgPicture.asset("assets/images/NewDesign/image/home/withdrawals_icon.svg"),
//                     SizedBox(width: 5.w),
//                     Expanded(
//                       child: TextWidget(
//                         title: "مسحوبات الرصيد | $consumed",
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     SizedBox(width: 8.w),
//                     SvgPicture.asset("assets/images/NewDesign/image/home/wave_icon.svg"),
//                     SizedBox(width: 5.w),
//                     Expanded(
//                       child: TextWidget(
//                         title: "الرصيد المتاح | $available",
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: ItemOfFromToWidget(
//                       title: "من",
//                       date: employeeVacationsModel.fromDate!.substring(0, 10) ?? " ",
//                     ),
//                   ),
//                   SizedBox(width: 8.w),
//                   Expanded(
//                     child: ItemOfFromToWidget(
//                       title: "الى",
//                       date: employeeVacationsModel.toDate!.substring(0, 10) ?? "22 نوفمبر 2024",
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   String getConsumedForTypeName(String wantedTypeName) {
//     final match = vacationBalances?.firstWhere(
//           (vb) => vb.vacationTypeName == wantedTypeName,
//       orElse: () => VacationTypeBalancs(
//         employeeName: '',
//         employeeId: 0,
//         employeeCode: '',
//         jobTitle: '',
//         vacationTypeName: wantedTypeName,
//         vacationTypeId: 0,
//         vacationTypeDuration: 0.0,
//         transferred: 0.0,
//         total: 0.0,
//         consumed: 0.0,
//         pending: 0.0,
//         postConsumed: 0.0,
//         available: 0.0,
//         totalView: 0.0,
//         settlemented: 0.0,
//         type: 0,
//         isAnnual: false,
//         hideBalance: false,
//       ),
//     );
//     return match!.consumed.toString();
//   }
//
//   String getAvailableForTypeName(String wantedTypeName) {
//     final match = vacationBalances?.firstWhere(
//           (vb) => vb.vacationTypeName == wantedTypeName,
//       orElse: () => VacationTypeBalancs(
//         employeeName: '',
//         employeeId: 0,
//         employeeCode: '',
//         jobTitle: '',
//         vacationTypeName: wantedTypeName,
//         vacationTypeId: 0,
//         vacationTypeDuration: 0.0,
//         transferred: 0.0,
//         total: 0.0,
//         consumed: 0.0,
//         pending: 0.0,
//         postConsumed: 0.0,
//         available: 0.0,
//         totalView: 0.0,
//         settlemented: 0.0,
//         type: 0,
//         isAnnual: false,
//         hideBalance: false,
//       ),
//     );
//     return match!.available.toString();
//   }
//
//   Widget getStatusText(String? status) {
//     switch (status?.toLowerCase()) {
//       case 'accepted':
//       case 'موافقة':
//         return Text("موافقة", style: TextStyle(color: AppColor.freshGreen));
//       case 'pending':
//       case 'قيد الاعتماد':
//         return Text("قيد الأعتماد", style: TextStyle(color: AppColor.orange));
//       case 'rejected':
//       case 'مرفوض':
//         return Text("مرفوض", style: TextStyle(color: AppColor.red));
//       default:
//         return Text("");
//     }
//   }
// }


class ItemTabAllVacationWidget extends StatelessWidget {
  final GetEmployeeVacationsResponseModel employeeVacationsModel;
  final List<VacationTypeBalancs>? vacationBalances;

  const ItemTabAllVacationWidget({
    super.key,
    required this.employeeVacationsModel,
    required this.vacationBalances,
  });

  @override
  Widget build(BuildContext context) {
    String vacationTypeName = employeeVacationsModel.vacationTypeName.toString();
    String duration = "${employeeVacationsModel.duration ?? "10"}";

    final consumed = getConsumedForTypeName(vacationTypeName);
    final available = getAvailableForTypeName(vacationTypeName);
    //final entitlement = getEntitlementForTypeName(vacationTypeName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12).r,
          padding: EdgeInsets.all(12).r,
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: AppColor.black12, width: 1.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    employeeVacationsModel.vacationTypeName ?? "",
                    style: context.text.titleMedium!.copyWith(
                      color: context.color.onSurface,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  getStatusText(employeeVacationsModel.status),
                  Spacer(),
                  OpeningTimeWidget(
                    title: employeeVacationsModel.fromDate!.substring(0, 10) ?? " ",
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8).r,
                decoration: BoxDecoration(
                  color: AppColor.lightBlueBg,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/NewDesign/image/home/withdrawals_icon.svg"),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: TextWidget(
                        title: "مسحوبات الرصيد | $consumed",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    SvgPicture.asset("assets/images/NewDesign/image/home/wave_icon.svg"),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: TextWidget(
                        title: "المتاح | $available",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // SizedBox(width: 5.w),
                    // Icon(Icons.stacked_line_chart, size: 18.sp, color: AppColor.primary),
                    // SizedBox(width: 5.w),
                    // Expanded(
                    //   child: TextWidget(
                    //     title: "الاستحقاق | $entitlement",
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ItemOfFromToWidget(
                      title: "من",
                      date: employeeVacationsModel.fromDate!.substring(0, 10) ?? " ",
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ItemOfFromToWidget(
                      title: "الى",
                      date: employeeVacationsModel.toDate!.substring(0, 10) ?? "22 نوفمبر 2024",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getConsumedForTypeName(String wantedTypeName) {
    final match = vacationBalances?.firstWhere(
          (vb) => vb.vacationTypeName == wantedTypeName,
      orElse: () => VacationTypeBalancs(
        employeeName: '',
        employeeId: 0,
        employeeCode: '',
        jobTitle: '',
        vacationTypeName: wantedTypeName,
        vacationTypeId: 0,
        vacationTypeDuration: 0.0,
        transferred: 0.0,
        total: 0.0,
        consumed: 0.0,
        pending: 0.0,
        postConsumed: 0.0,
        available: 0.0,
        totalView: 0.0,
        settlemented: 0.0,
        type: 0,
        isAnnual: false,
        hideBalance: false,
      ),
    );
    return match!.consumed.toString();
  }

  String getAvailableForTypeName(String wantedTypeName) {
    final match = vacationBalances?.firstWhere(
          (vb) => vb.vacationTypeName == wantedTypeName,
      orElse: () => VacationTypeBalancs(
        employeeName: '',
        employeeId: 0,
        employeeCode: '',
        jobTitle: '',
        vacationTypeName: wantedTypeName,
        vacationTypeId: 0,
        vacationTypeDuration: 0.0,
        transferred: 0.0,
        total: 0.0,
        consumed: 0.0,
        pending: 0.0,
        postConsumed: 0.0,
        available: 0.0,
        totalView: 0.0,
        settlemented: 0.0,
        type: 0,
        isAnnual: false,
        hideBalance: false,
      ),
    );
    return match!.available.toString();
  }

  // String getEntitlementForTypeName(String wantedTypeName) {
  //   final match = vacationBalances?.firstWhere(
  //         (vb) => vb.vacationTypeName == wantedTypeName,
  //     orElse: () => VacationTypeBalancs(
  //       employeeName: '',
  //       employeeId: 0,
  //       employeeCode: '',
  //       jobTitle: '',
  //       vacationTypeName: wantedTypeName,
  //       vacationTypeId: 0,
  //       vacationTypeDuration: 0.0,
  //       transferred: 0.0,
  //       total: 0.0,
  //       consumed: 0.0,
  //       pending: 0.0,
  //       postConsumed: 0.0,
  //       available: 0.0,
  //       totalView: 0.0,
  //       settlemented: 0.0,
  //       type: 0,
  //       isAnnual: false,
  //       hideBalance: false,
  //     ),
  //   );
  //   return match!.total.toString();
  // }

  Widget getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case 'accepted':
      case 'موافقة':
        return Text("موافقة", style: TextStyle(color: AppColor.freshGreen));
      case 'pending':
      case 'قيد الاعتماد':
        return Text("قيد الأعتماد", style: TextStyle(color: AppColor.orange));
      case 'rejected':
      case 'مرفوض':
        return Text("مرفوض", style: TextStyle(color: AppColor.red));
      default:
        return Text("");
    }
  }
}