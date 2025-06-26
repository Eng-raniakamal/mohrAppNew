import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/header_report_widget.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';

import '../../../../../../application/di.dart';
import '../../../../../../domain/model/model.dart';
import '../../../../../Requests/Salary/ViewModel/salaryViewModel.dart';
import '../../../layout/presentation/screen/layout_screen.dart';

class LastSalaryWidget extends StatefulWidget {
  const LastSalaryWidget({super.key, this.salaryModel});
  final SalaryItems? salaryModel;

  @override
  State<LastSalaryWidget> createState() => _LastSalaryWidgetState();
}

class _LastSalaryWidgetState extends State<LastSalaryWidget> {

  final SalaryViewModel _viewModel = instance<SalaryViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }



  @override
  Widget build(BuildContext context) {
    return

      StreamBuilder<SalaryViewObject>(
        stream: _viewModel.outputSalarys,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data?.salary == null || snapshot.data!.salary.isEmpty) {
            return Center(child: Text('No salary data available'));
          }

          // Safely access last index
          int lastIndex = snapshot.data!.salary.isNotEmpty ? snapshot.data!.salary.length - 1 : 0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //HeaderReportWidget(typeReport: AppStrings.lastSalary.tr()),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(12).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12).r,
                  border: Border.all(color: Colors.black12, width: 1.w),
                ),
                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // Row(
                //     //   mainAxisSize: MainAxisSize.min,
                //     //   children: [
                //     //     Container(
                //     //       // width: 44.w,
                //     //       // height: 44.h,
                //     //       decoration: BoxDecoration(
                //     //         borderRadius: BorderRadius.circular(12).r,
                //     //         color: Color(0xffF59E0B),
                //     //       ),
                //     //       child: Icon(Icons.credit_card, color: Colors.white),
                //     //     ),
                //     //     SizedBox(width: 22.w),
                //     //     SvgPicture.asset(
                //     //       "assets/images/NewDesign/image/home/opening-times.svg",
                //     //       color: Color(0xff0072C3),
                //     //     ),
                //     //     SizedBox(width: 3.w),
                //     //     // Text(
                //     //     //   getDate(snapshot.data!.salary[lastIndex].Month.toString()),
                //     //     //   style: AppTextStyle.iBMP14w500.copyWith(color: Color(0xff3D4966)),
                //     //     // ),
                //     //   ],
                //     // ),
                //     // Row(
                //     //   children: [
                //     //     Icon(
                //     //       Icons.account_balance_wallet_outlined,
                //     //       color: Color(0xff0072C3),
                //     //     ),
                //     //     SizedBox(width: 8.w),
                //     //     Text(
                //     //       snapshot.data!.salary[lastIndex].Value.toString(),
                //     //       style: AppTextStyle.iBMP14w500.copyWith(color: Color(0xff3D4966)),
                //     //     ),
                //     //     SizedBox(width: 8.w),
                //     //     IconButton(
                //     //       onPressed: () {
                //     //         Navigator.push(
                //     //           context,
                //     //           MaterialPageRoute(
                //     //             builder: (context) => LayoutScreen(initialIndex: 3), // Navigate to the salary tab
                //     //           ),
                //     //         );
                //     //       },
                //     //       icon: Icon(Icons.arrow_forward, size: 30, color: Colors.black),
                //     //     ),
                //     //   ],
                //     // ),
                //   ],
                // ),
              ),
            ],
          );
        },
      );

    //   StreamBuilder<SalaryViewObject>(
    //     stream: _viewModel.outputSalarys,
    //     builder: (context, snapshot) {
    //       int lastIndex=0;
    //       if(snapshot.data?.salary!=null) {
    //         lastIndex = snapshot.data!.salary.length - 1;
    //       }
    //       return  Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       HeaderReportWidget(typeReport: AppStrings.lastSalary.tr()),
    //       SizedBox(height: 8.h,),
    //       Container(
    //         padding: EdgeInsets.all(12).r,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(12).r,
    //           border: Border.all(color: Colors.black12, width: 1.w),
    //         ),
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Row(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Container(
    //                   width: 44.w,
    //                   height: 44.h,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(12).r,
    //                     color: Color(0xffF59E0B),
    //                   ),
    //                   child: Icon(Icons.credit_card, color: Colors.white),
    //                 ),
    //                 SizedBox(width: 22.w),
    //                 SvgPicture.asset("assets/images/NewDesign/image/home/opening-times.svg",
    //                   color: Color(0xff0072C3),
    //                 ),
    //                 SizedBox(width: 3.w),
    //                  Text(getDate(snapshot.data!.salary[lastIndex].Month.toString()),
    //                     //"يونيو 2024",
    //                     style: AppTextStyle.iBMP14w500.copyWith(color: Color(0xff3D4966)),
    //                   )
    //
    //               ],
    //             ),
    //             Row(
    //              // mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Icon(
    //                   Icons.account_balance_wallet_outlined,
    //                   color: Color(0xff0072C3),
    //                 ),
    //                 SizedBox(width: 8.w,),
    //                 Text(snapshot.data!.salary[lastIndex].Value.toString(),
    //                   //"34,0 EG",
    //                   style: AppTextStyle.iBMP14w500.copyWith(color: Color(0xff3D4966)),
    //                 ),
    //                 SizedBox(width: 8.w,),
    //
    //
    //                 IconButton(
    //                   onPressed:(){
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                         builder: (context) => LayoutScreen(initialIndex: 3), // يفتح على Tab المرتبات مثلاً
    //                     ));
    //                   },
    //                   icon: Icon(Icons.arrow_forward,size: 30,color: Colors.black,),
    //                 )
    //
    //
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   );}
    // );
  }

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
}
