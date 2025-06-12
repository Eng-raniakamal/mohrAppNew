import 'package:essmohr/presentation/newDesign/core/component/custom_tab_switcher_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_tab/vacation_tab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';


class TabVacationOfAppBarSwitcherWidget extends StatelessWidget {
  TabVacationOfAppBarSwitcherWidget({super.key});

  final List<String> tabs = ['أجازاتى', 'اعتماد الاجازات'];//0123

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VacationTabCubit, int>(
      builder: (context, state) {
        return Column(
          children: [
          AppBarManagementRequestWidget(title: tabs[state],onTap: (){
            context.read<VacationCubit>().changeTab(0);
            context.read<VacationTabCubit>().changeTab(0);
          },),
            SizedBox(height: 12.h),
          CustomTabSwitcherWidget(
              listTabs: tabs,
              selectedIndex: state,
              onTabChanged: (index) {
                context.read<VacationTabCubit>().changeTab(index);
              },
            ),
          ],
        );
      },
    );
  }
}
