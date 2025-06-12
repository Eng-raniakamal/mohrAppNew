import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

import '../../../../../../../core/component/input_data_widget.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key,  required this.reportModel});

  // final TextEditingController controller;
  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme
        .of(context)
        .colorScheme;
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الوقت", style: textTheme.bodyMedium),
        SizedBox(height: 8.h),




        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.outline),
            borderRadius: BorderRadius.circular(8),
            color: colorTheme.onPrimaryContainer,
          ),
          child: Row(
            children: [
              Icon(Icons.access_time_rounded, color: colorTheme.shadow),
              SizedBox(width: 8.w),

              Text(
               reportModel. time ?? "09:00 AM",
                style: textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
