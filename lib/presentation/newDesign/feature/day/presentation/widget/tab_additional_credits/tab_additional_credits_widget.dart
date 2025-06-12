import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/tab_additional_credits/item_credit_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

import '../../../../request/presentation/widget/request_type/management_request/AppBarTabManagementRequestWidget.dart';

class TabAdditionalCreditsWidget extends StatelessWidget {
  const TabAdditionalCreditsWidget({super.key});

  static final List<ReportModel> listItem = [
    ReportModel(
      isCertified: true,
      typeReport: "عدد ساعات العمل أكبر من الحد الأقصى",
      amount: 400,
      dateRequest: "30 ديسمبر 2023",
    ),
    ReportModel(
      isUnderReview: true,
      typeReport: "إنصراف متأخر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
    ReportModel(
      isRejected: true,
      typeReport: "حضور مبكر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
    ReportModel(
      isRejected: true,
      typeReport: "حضور مبكر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
    ReportModel(
      isUnderReview: true,
      typeReport: "إنصراف متأخر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        AppBarTabManagementRequestWidget(),
Column(children: listItem.map((e) => ItemCreditWidget(reportModel:e ,),).toList(),)

      ],
    );
  }
}

