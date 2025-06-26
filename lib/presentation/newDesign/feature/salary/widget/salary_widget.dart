import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/configure/route/app_route.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/presentation/data/salary_widget_model.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';

import '../../../../../application/constants.dart';
import '../../../../../application/di.dart';
import '../../../../../domain/model/model.dart';
import '../../../../Requests/Salary/View/salaryDetailsDialog.dart';
import '../../../../resources/routes.dart';

class SalaryWidget extends StatelessWidget {
  const SalaryWidget({super.key, this.salaryModel});

  final SalaryItems? salaryModel;

  String? getMonthName(String? date) {
    String? month;
    // String? partOfDate= getString(date!);
    switch (date) {
      case '1 ':
        return month = "January";

      case '2 ':
        return month = "February";

      case '3 ':
        return month = "March";

      case '4 ':
        return month = "April";

      case '5 ':
        return month = "May";

      case '6 ':
        return month = "June";

      case '7 ':
        return month = "July";

      case '8 ':
        return month = "August";

      case '9 ':
        return month = "September";

      case '10 ':
        return month = "October";

      case '11 ':
        return month = "November";

      case '12 ':
        return month = "December";
    }
    return month;
  }

  String getDate(String date) {
    var searchString = '-';
    var index = date.indexOf(searchString, 0);
    var partOfDate = date.substring(0, index);
    var restofDate = date.substring(index, date.length);
    String? month = getMonthName(partOfDate);
    String Date = "${month!} $restofDate";
    return Date;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19).r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: Colors.black12, width: 1.w),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/images/NewDesign/image/home/opening-times.svg",
                    color: AppColor.primary,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    getDate(salaryModel!.Month)?? "يونيو 2024",
                    style: AppTextStyle.iBMP14w500.copyWith(
                      color: Color(0xff3D4966),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: AppColor.primary,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    salaryModel?.Value.toString() ?? "34" ,
                    style: AppTextStyle.iBMP14w500.copyWith(
                      color: Color(0xff3D4966),
                    ),
                  ),
                ],
              ),
              GestureDetector(

    onTap: () {
    int id = salaryModel!.id;
    if (id == 0)
    {
      showToast(context,"لا يوجد مرتب متاح");
    //displayDialoge(context);
    }
    else {
    Constants.salaryDetailsId =
    id.toString();
    initSalaryDetailsModule();
    showCustomDialog(context, onValue: (_) {
      //Navigator.of(context).pushNamed(Routes.salaryDetails);
    });

    }},
                // onTap: () {
                //
                //   Navigator.of(context).pushNamed(Routes.salaryDetails);
                // },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.details.tr(),
                      style: AppTextStyle.iBMP14w500.copyWith(
                        color: Color(0xff3D4966),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.arrow_forward, size: 22),
                  ],
                ),

              )],
          ),
        ),
      ],
    );
  }

}

void showToast(BuildContext context,String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 4),
    ),
  );
}


// void displayDialoge(BuildContext context) {
//   AwesomeDialog(
//     context: context,
//     dialogType: DialogType.info,
//     animType: AnimType.scale,
//     title: AppStrings.alerts.tr(),
//     desc: AppStrings.no_salary_found.tr(),
//     btnOkText: AppStrings.ok.tr(),
//     btnOkOnPress: () {
//       Navigator.of(context).pop();
//     },
//   ).show();
// }
