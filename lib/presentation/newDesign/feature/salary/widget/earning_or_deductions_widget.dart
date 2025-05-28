import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/presentation/data/earning_or_deductions_model.dart';

class EarningOrDeductionsWidget extends StatelessWidget {
  const EarningOrDeductionsWidget({super.key,  this.earningOrDeductionsModel,
  });
  final EarningOrDeductionsModel ?earningOrDeductionsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(earningOrDeductionsModel?.label??"lable",
            textAlign: TextAlign.right,
            style: AppTextStyle.iBMP14w500,
          ),
          Text( earningOrDeductionsModel?.value??"",
            style: AppTextStyle.iBMP16w500,
          ),
        ],
      ),
    );
  }
}
