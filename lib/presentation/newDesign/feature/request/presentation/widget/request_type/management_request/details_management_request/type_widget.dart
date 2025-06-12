import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';



class TypeWidget extends StatelessWidget {
  const TypeWidget({super.key, required this.reportModel});
  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(   "النوع", style: textTheme.bodyMedium),
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
            " ${reportModel.typeReport ?? "النوع"}",
            style: textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}


