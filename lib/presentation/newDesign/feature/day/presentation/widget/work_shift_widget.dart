import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';

import '../../../../core/utils/import_file.dart';
import '../../../home/data/report_model.dart';

class WorkShiftWidget extends StatelessWidget {
  const WorkShiftWidget({super.key, required this.reportModel});
  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الوردية", style: textTheme.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          height: 60.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.outline),
            borderRadius: BorderRadius.circular(8),
            color: colorTheme.onPrimaryContainer,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemOfWorkShiftWidget(text:reportModel.workShiftOne ,),
                ItemOfWorkShiftWidget(text:reportModel.workShiftTwo ,),
                SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class ItemOfWorkShiftWidget extends StatelessWidget {
  const ItemOfWorkShiftWidget({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return                 SizedBox(
        width: 100.w,

        child:TextFormField(
          maxLength: 8,
          buildCounter: (
              BuildContext context, {
                required int currentLength,
                required bool isFocused,
                required int? maxLength,
              }) {
            return null;
          },
          style: context.text.titleMedium,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "PM 00:00",
          ),
          controller: TextEditingController(text: text),
        )
    );

  }
}
