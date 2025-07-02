import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/no_vacation_widget/body_no_vacation_widget.dart';

class NoVacationWidget extends StatelessWidget {
  const NoVacationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("الاجازات", style: context.text.displayMedium),
        // SizedBox(height: 20.h),
        // // VacationYearCurrentWidget(),
        // SizedBox(height: 36.h),
        const BodyNoVacationWidget(),

      ],
    );
  }
}
