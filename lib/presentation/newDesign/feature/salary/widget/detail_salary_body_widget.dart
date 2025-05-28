import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/presentation/data/earning_or_deductions_model.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/widget/list_earning_or_deductions_widget.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';

import '../../../../../domain/model/model.dart';

class DetailSalaryBodyWidget extends StatelessWidget {


  const DetailSalaryBodyWidget({super.key});




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              width: double.infinity,
              padding: EdgeInsets.all(12).r,
              decoration: BoxDecoration(
                color: Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Net salary: ',
                  style: AppTextStyle.iBMP18w700,
                  children: [
                    TextSpan(text: '13850 L.E', style: AppTextStyle.iBMP18w400),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ListEarningOrDeductionsWidget(list: EarningOrDeductionsModel.earnings,title:"الاستحقاقات" ,
            isEarnings: true,total: "15000",),
          SizedBox(height: 16.h),
          ListEarningOrDeductionsWidget(list:EarningOrDeductionsModel. deductions,title:"الاستقطاعات" ,
            isEarnings: false,total: "1150",)

        ],
      ),
    );
  }


}




