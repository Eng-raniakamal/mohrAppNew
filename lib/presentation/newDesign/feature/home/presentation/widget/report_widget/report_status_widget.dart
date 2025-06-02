import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

class ReportStatusWidget extends StatelessWidget {
  const ReportStatusWidget({
    super.key, required this.reportModel, this.isDetailsScreen,

  });
  final bool ?isDetailsScreen;

  final ReportModel reportModel;
  @override
  Widget build(BuildContext context) {
    var themeText = Theme.of(context).textTheme;
    var themeColor = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        reportModel.  isCertified == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: themeColor.onSecondary,
          ),
          child: Text("معتمدة", style: themeText.labelMedium),
        )
            : SizedBox(),
        //قيد التدقيق
        reportModel. isUnderReview == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: themeColor.secondaryFixed,
          ),
          child: Text("قيد التدقيق",
            style: themeText.labelMedium?.copyWith(
                color: themeColor.primaryFixed
            ),
          ),
        )
            : SizedBox(),
        reportModel. isRejected == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: themeColor.onError,
          ),
          child: Text("مرفوض",
            style: themeText.labelMedium?.copyWith(
                color: themeColor.error
            ),
          ),
        )
            : SizedBox(),
        SizedBox(width: 3.w),
        isDetailsScreen==null?Text(reportModel.nameReport ?? "", style:themeText.displaySmall):SizedBox.shrink(),
      ],
    );
  }
}