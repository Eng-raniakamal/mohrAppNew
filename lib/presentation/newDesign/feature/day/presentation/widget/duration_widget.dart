import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

import '../../../../core/utils/import_file.dart';



class DurationWidget extends StatelessWidget {
  const DurationWidget({super.key, required this.reportModel});
  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(  "المدة", style: textTheme.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.outline),
            borderRadius: BorderRadius.circular(8),
            color: colorTheme.onPrimaryContainer,
          ),
          child: Text(
            " ${reportModel.duration ?? "240 دقيقة"}",
            style: textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
