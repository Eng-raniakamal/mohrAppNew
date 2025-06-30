
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
import '../../../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class ItemTabAllVacationWidget extends StatelessWidget {
  final GetEmployeeVacationsResponseModel employeeVacationsModel;

  const ItemTabAllVacationWidget({
    super.key,
    required this.employeeVacationsModel,
  });

  @override
  Widget build(BuildContext context) {
    String vacationTypeName=employeeVacationsModel.vacationTypeName.toString();
    String duration = "${employeeVacationsModel.duration ?? "10"}";
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
              // معتمده - تحت الطلب -مرفوض - التاريخ
              Row(
                children: [
                  Text(
                    employeeVacationsModel.vacationTypeName ?? "",
                    style: context.text.titleMedium!.copyWith(
                      color: context.color.onSurface,
                    ),
                  ),
                  Spacer(),
    OpeningTimeWidget(title:employeeVacationsModel.fromDate!.substring(0,10) ?? " ",)
                  ,//OpeningTimeWidget(title: "المدة : $duration  أيام"),
                ],
              ),
              SizedBox(height: 12.h),

              //عدد الاقساط -- مسحوبات الرصيد
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8).r,
                decoration: BoxDecoration(
                  color: AppColor.lightBlueBg,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                // child: Row(
                //   children: [
                //     SvgPicture.asset("assets/images/NewDesign/image/home/withdrawals_icon.svg"),
                //     SizedBox(width: 5.w),
                //     TextWidget(
                //       title:
                //           "مسحوبات الرصيد | "  + getConsumedForTypeName(vacationTypeName).toString(),
                //     ),
                //     SizedBox(width: 61.w),
                //     SvgPicture.asset("assets/images/NewDesign/image/home/wave_icon.svg"),
                //     SizedBox(width: 5.w),
                //     TextWidget(
                //       title:
                //           "الرصيد المتاح| "+  getAvailableForTypeName(vacationTypeName).toString(),
                //     ),
                //   ],
                // ),


                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/NewDesign/image/home/withdrawals_icon.svg"),
                    SizedBox(width: 5.w),

                    // مسحوبات الرصيد ضمن Expanded
                    Expanded(
                      child: FutureBuilder<String>(
                        future: getConsumedForTypeName(vacationTypeName),
                        builder: (context, snapshot) {
                          final consumed = snapshot.data ?? '0';
                          return TextWidget(
                            title: "مسحوبات الرصيد | $consumed",
                            overflow: TextOverflow.ellipsis,  // ← اقتصاص بنقاط النهاية
                          );
                        },
                      ),
                    ),

                    SizedBox(width: 8.w),  // قلَّلنا المسافة بدل 61.w
                    SvgPicture.asset("assets/images/NewDesign/image/home/wave_icon.svg"),
                    SizedBox(width: 5.w),

                    // الرصيد المتاح ضمن Expanded
                    Expanded(
                      child: FutureBuilder<String>(
                        future: getAvailableForTypeName(vacationTypeName),
                        builder: (context, snapshot) {
                          final available = snapshot.data ?? '0';
                          return TextWidget(
                            title: "الرصيد المتاح | $available",
                            overflow: TextOverflow.ellipsis,  // ← اقتصاص
                          );
                        },
                      ),
                    ),
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
                      date: employeeVacationsModel.fromDate!.substring(0,10) ?? " ",
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ItemOfFromToWidget(
                      title: "الى",
                      date: employeeVacationsModel.toDate!.substring(0,10) ?? "22 نوفمبر 2024",
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


  Future<List<VacationTypeBalancs>> getVacationTypeBalances() async {
    final AppPreferences _appPreferences = instance<AppPreferences>();
    String userId = await _appPreferences.getUserToken();

    final response = await http.get(
      Uri.parse(Constants.getVacationTypesBalances),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId,
      },
    );

    final responseData = json.decode(response.body);
    if (responseData != null) {
      final vacationTypesBalances = responseData as List;
      final List<VacationTypeBalancs> b = vacationTypesBalances
          .map((jsonData) => VacationTypeBalancs.fromJson(jsonData))
          .toList();
      return b;
    }

    // لو لم يكن هناك بيانات رجع قائمة فارغة
    return [];
  }

  Future<String> getConsumedForTypeName(String wantedTypeName) async {
    // أولاً تجلب القائمة كاملة
    final List<VacationTypeBalancs> b = await getVacationTypeBalances();

    // ثم تبحث عن أول عنصر يطابق الـ typeName
    final match = b.firstWhere(
          (vb) => vb.vacationTypeName == wantedTypeName,
      orElse: () => VacationTypeBalancs.fromJson({
        'vacationTypeName': wantedTypeName,
        'consumed': 0.0,
        // وإذا كان عندك حقول أخرى، عبيها بقيم sensible
      }),
    );

    double x =match.consumed;
    // عدِل حسب حقل الـ balance في الموديل عندك
    return x.toString()
    ;
  }

  Future<String> getAvailableForTypeName(String wantedTypeName) async {
    // أولاً تجلب القائمة كاملة
    final List<VacationTypeBalancs> b = await getVacationTypeBalances();

    // ثم تبحث عن أول عنصر يطابق الـ typeName
    final match = b.firstWhere(
          (vb) => vb.vacationTypeName == wantedTypeName,
      orElse: () => VacationTypeBalancs.fromJson({
        'vacationTypeName': wantedTypeName,
        'available': 0.0,
        // وإذا كان عندك حقول أخرى، عبيها بقيم sensible
      }),
    );

    double x =match.available;
    // عدِل حسب حقل الـ balance في الموديل عندك
    return x.toString();
    // عدِل حسب حقل الـ balance في الموديل عندك

  }



}
