import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/notes_additional_widget.dart';

import '../../../home/data/report_model.dart';

class ItemOfTabAdditionalRequestWidget extends StatelessWidget {
  const ItemOfTabAdditionalRequestWidget({
    super.key,
    required this.reportModel,
    this.titleItem
  });

  final ReportModel reportModel;
     final String?titleItem;
  @override
  Widget build(BuildContext context) {
    return Container(
margin: EdgeInsets.only(top: 16).r,
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: context.color.outline, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 12.w),
              Text(
                titleItem?? "عدد ساعات العمل أكبر من الحد الأقصى",
                style: context.text.titleMedium,
              ),
              Spacer(),
              Checkbox(value: false, onChanged: (value) {}),
            ],
          ),
          SizedBox(width: 16.h),
          Row(
            children: [
              SizedBox(width: 12.w),
              Icon(Icons.calendar_today_outlined,size: 22.r,),
              SizedBox(width: 8.w),
              Text(
                "تاريخ الطلب  : ${reportModel.dateRequest}",
                style: context.text.titleMedium!.copyWith(fontSize: 12.sp),
              ),
              Spacer(),
              SizedBox(
                width: 150.w,
                child: InputDataWidget(
                  controller: TextEditingController(text: reportModel.time),
                  hint: "09:00 PM ",
                  prefixIcon: Icon(
                    Icons.access_time_rounded,
                    color: context.color.shadow,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.h),
          NotesAdditionalWidget(
            controller: TextEditingController(text: reportModel.not),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}

