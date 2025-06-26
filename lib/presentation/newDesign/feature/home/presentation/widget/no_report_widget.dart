import 'package:essmohr/presentation/newDesign/core/utils/app_text_style.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoReportWidget extends StatelessWidget {
  const NoReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20).r,
      child: SizedBox(
         // height: 356.h,
          child: Column(
            children: [
              SizedBox(height: 70.h),
              SvgPicture.asset("assets/images/NewDesign/image/home/no_report.svg"),
              SizedBox(height: 25.h),
              Text("لا يوجد تقارير", style: AppTextStyle.iBMP24w600Black),
              SizedBox(height: 12.h),
              Text("اهلا بك في نظام سينك لادارة الموارد البشرية", style: AppTextStyle.iBMP16w500Gray)
            ],
          )),
    );
  }
}
