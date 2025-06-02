import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

class DateRequestWidget extends StatelessWidget {
  const DateRequestWidget({super.key, this.reportModel});

  final ReportModel? reportModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.calendar_today_outlined, size: 15),
        SizedBox(width: 8.w),
        reportModel != null
            ? Text(
          reportModel!.dateRequest != null
              ? "تاريخ تقديم الطلب  :${reportModel!.dateRequest}"
              : "تاريخ تقديم الطلب  :غير متاح",

          style: AppTextStyle.iBMP12w500MidnightBlue,// Color(0xff3D4966)
        )
            : Text(
          "تاريخ تقديم الطلب  : 30 ديسمبر 2023",
          style: AppTextStyle.iBMP12w500MidnightBlue,
        ),
      ],
    );
  }
}