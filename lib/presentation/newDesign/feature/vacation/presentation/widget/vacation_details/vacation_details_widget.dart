import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/request/data/model/account_model.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/add_request/add_document_button_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/account_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/nots_details_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/submission_date_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/type_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_details/app_bar_details_vacation_widget.dart';
import 'package:essmohr/presentation/newDesign/generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VacationDetailsWidget extends StatelessWidget {
  const VacationDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ReportModel reportModel = context.read<VacationCubit>().getReportModel();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            // معتمده - تحت الطلب -مرفوض
            AppBarDetailsVacationWidget(reportModel: reportModel),
            SizedBox(height: 16.h),
            // النوع
            TypeWidget(reportModel: reportModel),
            SizedBox(height: 16.h),
            //   التاريخ
            SubmissionDateWidget(
              reportModel: ReportModel(dateRequest: "22 نوفمبر2024"),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FTDayWidget(title: "من", date: "22 نوفمبر2024"),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: FTDayWidget(title: "الى", date: "22 نوفمبر2024"),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            InputDataWidget(
              controller: TextEditingController(text: reportModel.duration),
              hint: "المدة ",
              title: "المدة",
              fillColor: context.color.onPrimaryContainer,
            ),
            SizedBox(height: 16.h),
            InputDataWidget(
              controller: TextEditingController(text: "محمد فتحى غانم"),
              hint: "النائب ",
              title: "النائب",
              fillColor: context.color.onPrimaryContainer,
            ),
            SizedBox(height: 16.h),
            Row(
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
        ),
      ),
    );
  }
}

class FTDayWidget extends StatelessWidget {
  const FTDayWidget({super.key, required this.title, required this.date});

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: context.color.outline),
            borderRadius: BorderRadius.circular(8).r,
            color: context.color.onPrimaryContainer,
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: context.color.surfaceContainer,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                " ${date ?? "تاريخ اليوم"}",
                style: context.text.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
