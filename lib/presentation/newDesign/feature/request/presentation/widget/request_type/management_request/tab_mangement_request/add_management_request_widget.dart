import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_date_day_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/request/request_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/add_request/add_document_button_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/add_request/list_reviewer_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/notes_input_field.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/widget/custom_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//طلب ادارى شاشة اضافة

class AddManagementRequestWidget extends StatefulWidget {
  const AddManagementRequestWidget({super.key});

  @override
  State<AddManagementRequestWidget> createState() => _AddManagementRequestWidgetState();
}

class _AddManagementRequestWidgetState extends State<AddManagementRequestWidget> {
  final TextEditingController requestTypeController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController noteInputController = TextEditingController();

  final TextEditingController accController = TextEditingController();
@override
  void dispose() {
    requestTypeController.dispose();
    timeController.dispose();
    noteInputController.dispose();
    accController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
        child: Column(
          children: [
            SizedBox(height: 12.h),
            AppBarManagementRequestWidget(title: "اضافة طلب ادارى",
            onTap: (){
              context.read<TabSwitcherCubit>().changeTab(0);
            },
            ),
            SizedBox(height: 8.h),
            InputDataWidget(
              title: "نوع الطلب",
              hint: "اختر",
              controller: requestTypeController,
            ),
            SizedBox(height: 16.h),
            InputDateDayWidget(
              data: "التاريخ",
            ),
            SizedBox(height: 16.h),
            InputDataWidget(
              title: "الوقت",
              hint: "09:00AM",
              controller: timeController,
            ),
            SizedBox(height: 16.h),
            NotesInputField(controller:noteInputController ),
            SizedBox(height: 44.h),
            AddDocumentButtonWidget(),
            SizedBox(height: 16.h),
            InputDataWidget(
              title: "اضافة مراجع",
              hint: "محمد طارق",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(BorderSide.strokeAlignOutside),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEDF9FF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12).r,
                      bottomLeft: Radius.circular(12).r,
                    ),
                  ),
                  child: Icon(Icons.add,color: Color(0xff1783B5),),
                ),
              ),
              controller: accController,
            ),
            SizedBox(height: 16.h),
            ListReviewerWidget(),
            SizedBox(height: 16.h),
            ListReviewerWidget(),
            SizedBox(height: 16.h),
            CustomButtonWidget(onTap: (){
              BlocProvider.of<RequestCubit>(context).changePage(0);

            }, title: "قدم الطلب"),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

