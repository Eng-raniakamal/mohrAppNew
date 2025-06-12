import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_tab/vacation_tab_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/tab_all_vacation/tab_all_vacation_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/tab_credits_vacation/tab_credits_vacation_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/tab_vacation_of_app_bar_switcher.dart';

class BodyTabWidget extends StatelessWidget {
  const BodyTabWidget({super.key});

  static final List<Widget> body = [
    TabAllVacationWidget(),
    TabCreditsVacationWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VacationTabCubit, int>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TabVacationOfAppBarSwitcherWidget(),
              SizedBox(height: 16.h),
              body[state],
            ],
          ),
        );
      },
    );
  }
}
