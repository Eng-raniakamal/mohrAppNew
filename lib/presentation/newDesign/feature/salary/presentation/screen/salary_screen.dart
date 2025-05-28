import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/presentation/data/salary_widget_model.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/widget/salary_widget.dart';

class SalaryScreen extends StatelessWidget {
  const SalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          // child: Column(
          //   children: List.generate(
          //     SalaryWidgetModel.salaryList.length,
          //     (index) => Padding(
          //       padding: const EdgeInsets.only(bottom: 12.0).r,
          //       child: SalaryWidget(salaryModel: SalaryWidgetModel.salaryList[index],),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
