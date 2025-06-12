import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/date_request_widget.dart';

class ItemOfTabCreditsRequestWidget extends StatelessWidget {
  const ItemOfTabCreditsRequestWidget({
    super.key,
    required this.reportModel,
  });

  final ReportModel reportModel;
  static const IconData moreH = IconData(0xe402, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: Colors.black12, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // معتمده - تحت الطلب -مرفوض - التاريخ
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReportStatusWidget(
                reportModel: reportModel,
              ),
              Icon(moreH)
            ],
          ),

          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("اسم الموظف  : محمد فتحى محمد غانم"),
              Text("مصمم تجربة مستخدم"),
            ],
          ),
          SizedBox(height: 8.h),
          DateRequestWidget(reportModel: reportModel,),

        ],
      ),
    );
  }
}
