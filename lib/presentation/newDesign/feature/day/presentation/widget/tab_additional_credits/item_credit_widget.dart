import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/tab_all_additional/day_report_status_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

class ItemCreditWidget extends StatelessWidget {
  const ItemCreditWidget({super.key, required this.reportModel});
  final ReportModel reportModel;
  static const IconData moreH = IconData(0xe402, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.all(12).r,
      margin: EdgeInsets.only(top: 16).r,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: context.color.outline, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DayReportStatusWidget(reportModel: reportModel),
              SizedBox(width: 12.w),
              Text(
                reportModel.typeReport ?? "عدد ساعات العمل أكبر من الحد الأقصى",
                style: context.text.titleMedium,
              ),
              Spacer(),
              Icon(moreH)
            ],
          ),
          SizedBox(width: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("اسم الموظف  : محمد فتحى محمد غانم", style: context.text.titleSmall),
              Text("مصمم تجربة مستخدم", style: context.text.titleSmall),
            ],
          ),
          SizedBox(width: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 20.r),
                  SizedBox(width: 8.w),
                  Text(
                    "تاريخ الطلب  : ${reportModel.dateRequest}",
                    style: context.text.titleMedium!.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: context.color.shadow,
                  ),
                  Text("09:00 PM ", style: context.text.titleSmall),
                ],
              )
            ],
          ),
          SizedBox(width: 16.h),
        ],
      ),
    );
  }
}
