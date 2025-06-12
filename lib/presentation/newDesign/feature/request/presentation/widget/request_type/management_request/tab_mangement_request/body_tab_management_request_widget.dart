import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/AppBarTabManagementRequestWidget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/item_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/widget/custom_button_widget.dart';

class BodyTabManagementRequestWidget extends StatelessWidget {
  const BodyTabManagementRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarTabManagementRequestWidget(),
        SizedBox(height: 12.h),
        Column(
          children:
          ReportModel.listManagement
              .map((e) => ItemRequestWidget(reportModel: e))
              .toList(),
        ),
        SizedBox(height: 21.h),
        CustomButtonWidget(
          onTap: () {
            BlocProvider.of<TabSwitcherCubit>(context).changeTab(2);
          },
          title: "طلب ادارى",
        ),
      ],
    );
  }
}
