import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_date_day_widget.dart';
import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/tab_add_additional/Additional_request_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/work_shift_widget.dart';

import '../../home/data/report_model.dart';
import '../../request/presentation/widget/add_request/add_document_button_widget.dart';
import '../../request/presentation/widget/notes_input_field.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  static final ReportModel reportModel = ReportModel(
    dateRequest: "22 نوفمبر2024",
    time: "09:00 PM ",
    typeReport: "انصراف",
    alertType: "عدد ساعات عمل أكبر من الحد الاقصى",
    workShiftOne: "09:00 AM ",
    workShiftTwo: "05:00 PM ",
    duration: "240 دقيقة",

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("التفاصيل", style: context.text.displayMedium),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(12).r,
            //color: context.color.secondary, // Color(0xffF2F5F9)
            child: Icon(Icons.close),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              //   التاريخ
              InputDateDayWidget(
                data: "تاريخ الطلب",
                fillColor: context.color.onPrimaryContainer,
              ),
              SizedBox(height: 16.h),
              //النوع
              InputDataWidget(
                title: "النوع",
                hint: "النوع",
                controller: TextEditingController(text: reportModel.typeReport),
                fillColor: context.color.onPrimaryContainer,
              ),
              SizedBox(height: 16.h),
              //نوع التنبيه
              InputDataWidget(
                title: "نوع التنبيه",
                hint: "نوع التنبيه",
                controller: TextEditingController(text: reportModel.alertType),
                fillColor: context.color.onPrimaryContainer,
              ),
              SizedBox(height: 16.h),
              InputDataWidget(
                controller: TextEditingController(text: reportModel.time),
                hint: "09:00 PM ",
                title: "الوقت",
                fillColor: context.color.onPrimaryContainer,
                prefixIcon: Icon(
                  Icons.access_time_rounded,
                  color: context.color.shadow,
                ),
              ),
              SizedBox(height: 16.h),
              WorkShiftWidget(reportModel: reportModel),
              SizedBox(height: 16.h),
              InputDataWidget(
                controller: TextEditingController(text: reportModel.duration),
                hint: "المدة ",
                title: "المدة",
                fillColor: context.color.onPrimaryContainer,
              ),
              SizedBox(height: 16.h),
              NotesInputField(controller: TextEditingController()),
              SizedBox(height: 15.h),
              AddDocumentButtonWidget(),
              SizedBox(height: 15.h),
              Text("اضافة مراجع", style: context.text.bodyMedium),
              SizedBox(height: 5.h),
              CustomElevatedButtonWidget(
                data: "طلب اضافى",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AdditionalRequestScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
