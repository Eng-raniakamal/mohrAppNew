import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

import '../../../../home/data/report_model.dart';
import '../../../../request/presentation/widget/request_type/management_request/AppBarTabManagementRequestWidget.dart';
import 'day_item_widget.dart';

class DayAllAdditionalWidget extends StatelessWidget {
  const DayAllAdditionalWidget({super.key});

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        AppBarTabManagementRequestWidget(),
        SizedBox(height: 16.h),
        Column(
          children:
              listItem
                  .map((e) => DayItemRequestWidget(reportModel: e))
                  .toList(),
        ),

      ],
    );
  }
}

