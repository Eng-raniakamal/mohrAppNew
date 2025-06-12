import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/data/model/account_model.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/add_request/add_document_button_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/account_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/app_bar_details_item_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/nots_details_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/submission_date_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/time_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/type_widget.dart';
import 'package:essmohr/presentation/newDesign/generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsItemOfRequestWidget extends StatelessWidget {
  const DetailsItemOfRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabSwitcherCubit, int>(
      builder: (context, state) {
        ReportModel reportModel =
            context.read<TabSwitcherCubit>().getReportModel();
        return Column(
          children: [
            SizedBox(height: 16.h),
            // معتمده - تحت الطلب -مرفوض
            AppBarDetailsItemRequestWidget(reportModel: reportModel),
            SizedBox(height: 16.h),
            //   التاريخ
            SubmissionDateWidget(reportModel: reportModel),
            SizedBox(height: 16.h),
            //النوع
            TypeWidget(reportModel: reportModel),
            SizedBox(height: 16.h),
            TimeWidget(reportModel: reportModel),
            //المراجع الاول الثانى
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  AccountModel.accountList
                      .map((e) => AccountWidget(accountModel: e))
                      .toList(),
            ),
            SizedBox(height: 16.h),
            AddDocumentButtonWidget(
              onTap: (){},
              title: "الوثائق",
              widget: SizedBox(
                width: 20.w,
                height: 25.h,
                child: Image.asset(Assets.requestPdf),
              ),
            ),
            SizedBox(height: 16.h),
            NotsDetailsWidget(reportModel: reportModel,),
            SizedBox(height: 16.h),

          ],
        );
      },
    );
  }
}

