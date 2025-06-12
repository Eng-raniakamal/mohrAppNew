import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_date_day_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/item_of_tab_additional_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';

class BodyAddAdditionalRequest extends StatelessWidget {
  const BodyAddAdditionalRequest({super.key});


  static final TextEditingController requestTypeController =
  TextEditingController();

  static final ReportModel reportModel = ReportModel(
    dateRequest: "22 نوفمبر2024",
    time: "09:00 PM ",
    typeReport: "انصراف",
    alertType: "عدد ساعات عمل أكبر من الحد الاقصى",
    workShiftOne: "09:00 AM ",
    workShiftTwo: "05:00 PM ",
    duration: "240 دقيقة",
    not: "not",
  );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          InputDataWidget(
            hint: "اختر",
            controller: requestTypeController,
            title: "نوع الطلب",
            suffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.color.onSurface,
            ),
          ),
          SizedBox(height: 16.h),
          //   التاريخ
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: InputDateDayWidget(data: "من")),
              Expanded(child: InputDateDayWidget(data: "الى")),
            ],
          ),
          SizedBox(height: 16.h),
          //تحديد الكل
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "تحديد الكل",
                style: context.text.bodyMedium!.copyWith(fontSize: 18.sp),
              ),
              Checkbox(value: false, onChanged: (value) {}),
            ],
          ),
          SizedBox(height: 16.h),
          ItemOfTabAdditionalRequestWidget(
            reportModel: reportModel,
            titleItem: "عدد ساعات العمل أكبر من الحد الأقصى",
          ),
          ItemOfTabAdditionalRequestWidget(
            reportModel: reportModel,
            titleItem: "إنصراف متأخر",
          ),
          ItemOfTabAdditionalRequestWidget(
            reportModel: reportModel,
            titleItem: "حضور مبكر",
          ),
        ],
      ),
    );
  }
}
