import 'package:essmohr/presentation/newDesign/feature/day/control/day_tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/day_app_bar_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/day_tab_switch_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/tab_add_additional/body_add_additional_request.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/tab_additional_credits/tab_additional_credits_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/day/presentation/widget/tab_all_additional/day_all_additional_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';

class AdditionalRequestScreen extends StatelessWidget {
  const AdditionalRequestScreen({super.key});

  static final List<String> tabs = [
    "اضافة طلب اضافى",
    "طلباتى للاضافى",
    "اعتمادات الاضافى",
  ];
  static final List<Widget> body = [
    BodyAddAdditionalRequest(),
    DayAllAdditionalWidget(),
    TabAdditionalCreditsWidget()

  ];


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => DayTabSwitcherCubit(),
        child:BlocBuilder<DayTabSwitcherCubit,int>(
          builder: (context, state) {
            return Scaffold(
                appBar: DayAppBarWidget(title: tabs[state],),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        DayTabSwitchWidget(tabs: tabs),

                        body[state],
                      ],
                    ),
                  ),
                )
            );
          },
        ),
      ),
    );
  }
}

