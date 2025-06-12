import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/number_of_request_advance_and_sick_leave.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/opening_time_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/item_of_from_to_widget.dart';

class ItemTabAllVacationWidget extends StatelessWidget {
  const ItemTabAllVacationWidget({super.key, required this.reportModel});

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 150.h,
          margin: EdgeInsets.only(bottom: 12).r,
          padding: EdgeInsets.all(12).r,
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: AppColor.black12, width: 1.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // معتمده - تحت الطلب -مرفوض - التاريخ
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReportStatusWidget(reportModel: reportModel),
                  OpeningTimeWidget(title: "المدة : 10 أيام"),
                ],
              ),
              SizedBox(height: 12.h),
              //عدد الاقساط -- مسحوبات الرصيد
              reportModel.isRejected == true
                  ? SizedBox.shrink()
                  : NumberOfRequestAdvanceAndSickLeave(
                reportModel: reportModel,
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ItemOfFromToWidget(
                      title: "من",
                      date: "22 نوفمبر2024",
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ItemOfFromToWidget(
                      title: "من",
                      date: "22 نوفمبر2024",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
