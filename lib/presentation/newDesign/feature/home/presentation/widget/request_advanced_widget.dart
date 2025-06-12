import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/text_widget.dart';

class RequestAdvanceWidget extends StatelessWidget {
  final ReportModel reportModel;

  const RequestAdvanceWidget({super.key, required this.reportModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/images/NewDesign/image/home/money-bills.svg"),
        SizedBox(width: 5.w),
        TextWidget(
          title: " عدد الاقساط :${reportModel.numberOfInstallments}",
        ),
        SizedBox(width: 32.w),
        SvgPicture.asset("assets/images/NewDesign/image/home/money-bill.svg"),
        SizedBox(width: 5.w),
        TextWidget(title: "${reportModel.amount}\$"),
      ],
    );
  }
}