import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

class SubmissionDateWidget extends StatelessWidget {
  const SubmissionDateWidget({super.key, required this.reportModel});

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("تاريخ تقديم الطلب", style: textTheme.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.outline),
            borderRadius: BorderRadius.circular(8),
            color: colorTheme.onPrimaryContainer,
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: context.color.surfaceContainer,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(" ${reportModel.dateRequest}", style: textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
