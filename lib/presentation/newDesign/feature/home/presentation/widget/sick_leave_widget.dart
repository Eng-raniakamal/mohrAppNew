import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/text_widget.dart';

class SickLeaveWidget extends StatelessWidget {
  final ReportModel reportModel;

  const SickLeaveWidget({super.key, required this.reportModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/images/NewDesign/image/home/withdrawals_icon.svg"),
        SizedBox(width: 5.w),
        TextWidget(
          title: "مسحوبات الرصيد | ${reportModel.numberOfInstallments}",
        ),
        SizedBox(width: 32.w),
        SvgPicture.asset("assets/images/NewDesign/image/home/wave_icon.svg"),
        SizedBox(width: 5.w),
        TextWidget(title: "الرصيد المتاح| ${reportModel.amount}"),
      ],
    );
  }
}