import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/request/request_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/body_tab_management_request_widget.dart';

class TabManagementRequestWidget extends StatelessWidget {
  const TabManagementRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        AppBarManagementRequestWidget(
          title: "طلباتى الادارية",
          onTap: () {
            context.read<RequestCubit>().changePage(0);
          },
        ),
        SizedBox(height: 12.h),
        RequestTabOfAppBarSwitcher(),
        SizedBox(height: 12.h),
        BodyTabManagementRequestWidget(),
      ],
    );
  }
}
