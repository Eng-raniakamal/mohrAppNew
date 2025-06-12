import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/tab_all_additional/day_report_status_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

class DayItemRequestWidget extends StatelessWidget {
  const DayItemRequestWidget({super.key, required this.reportModel});

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.read<TabSwitcherCubit>().changeTab(3);
        // context.read<TabSwitcherCubit>().setReportModel(reportModel);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12).r,
        margin: EdgeInsets.only(bottom: 12).r,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(color: AppColor.black12, width: 1.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معتمده - تحت الطلب -مرفوض - التاريخ
            Row(
              children: [
                DayReportStatusWidget(reportModel: reportModel),
                SizedBox(width: 8.h),
                Text(
                  reportModel.typeReport?? "عدد ساعات",
                  style: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20.r,
                  color: context.color.surfaceContainer,
                ),
                SizedBox(width: 8.w),
                Text(
                  "تاريخ الطلب  : ${reportModel.dateRequest}",
                  style: context.text.titleMedium!.copyWith(fontSize: 12.sp),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: context.color.shadow,
                    ),
                    Text("${reportModel.time??"9:00"} PM ", style: context.text.bodyMedium),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
