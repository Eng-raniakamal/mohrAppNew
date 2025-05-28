import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/header_report_widget.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';

import '../../../../../resources/routes.dart';
import '../../../layout/presentation/screen/layout_screen.dart';

class LastSalaryWidget extends StatelessWidget {
  const LastSalaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderReportWidget(typeReport: AppStrings.lastSalary.tr()),
        SizedBox(height: 8.h,),
        Container(
          padding: EdgeInsets.all(12).r,
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
                  Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      color: Color(0xffF59E0B),
                    ),
                    child: Icon(Icons.credit_card, color: Colors.white),
                  ),
                  SizedBox(width: 22.w),
                  SvgPicture.asset("assets/images/NewDesign/image/home/opening-times.svg",
                    color: Color(0xff0072C3),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    "يونيو 2024",
                    style: AppTextStyle.iBMP12w500.copyWith(color: Color(0xff3D4966)),
                  ),
                ],
              ),
              Row(
               // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Color(0xff0072C3),
                  ),
                  SizedBox(width: 8.w,),
                  Text(
                    "34,0 EG",
                    style: AppTextStyle.iBMP12w500.copyWith(color: Color(0xff3D4966)),
                  ),
                  SizedBox(width: 8.w,),


                  IconButton(
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => LayoutScreen(initialIndex: 3), // يفتح على Tab المرتبات مثلاً
                      ));
                    },
                    icon: Icon(Icons.arrow_forward,size: 30,color: Colors.black,),
                  )


                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
