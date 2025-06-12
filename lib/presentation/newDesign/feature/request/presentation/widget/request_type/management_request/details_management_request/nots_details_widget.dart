import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

class NotsDetailsWidget extends StatelessWidget {
  const NotsDetailsWidget({super.key, required this.reportModel});
  final ReportModel reportModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(reportModel.not??'ملاحظات اضافية', style: AppTextStyle.iBMP14w500),
        SizedBox(height: 8.h),
        Container(
          height: 79.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Text('نص الملاحظات'),
        ),
      ],
    );
  }
}
