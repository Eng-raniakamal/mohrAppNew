
import '../../../../../core/utils/import_file.dart';
import '../../../data/report_model.dart';
import '../request_advanced_widget.dart';
import '../sick_leave_widget.dart';

class NumberOfRequestAdvanceAndSickLeave extends StatelessWidget {
  const NumberOfRequestAdvanceAndSickLeave({
    super.key,
    required this.reportModel,
  });

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8).r,
      decoration: BoxDecoration(
        color:
            reportModel.isSickLeave == true
                ? context.color.onPrimaryFixed
                : null,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (reportModel.isRequestAdvance == true)
                RequestAdvanceWidget(reportModel: reportModel),
              if (reportModel.isSickLeave == true)
                SickLeaveWidget(reportModel: reportModel),
            ],
          ),
        ],
      ),
    );
  }
}
