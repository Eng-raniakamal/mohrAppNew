import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/date_request_widget.dart';

class ItemRequestWidget extends StatelessWidget {
  const ItemRequestWidget({super.key, required this.reportModel});

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TabSwitcherCubit>().changeTab(3);
        context.read<TabSwitcherCubit>().setReportModel(reportModel);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12).r,
        margin: EdgeInsets.only(bottom: 12).r,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(color:AppColor.black12, width: 1.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معتمده - تحت الطلب -مرفوض - التاريخ
            ReportStatusWidget(reportModel: reportModel),
            SizedBox(height: 8.h),
            DateRequestWidget(reportModel: reportModel),
          ],
        ),
      ),
    );
  }
}

