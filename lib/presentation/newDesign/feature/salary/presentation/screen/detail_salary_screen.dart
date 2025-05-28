import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/widget/detail_salary_body_widget.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';

import '../../../../../../domain/model/model.dart';

class DetailSalaryScreen extends StatelessWidget {
  const DetailSalaryScreen({super.key, required this.salaryItem});

final SalaryDetails salaryItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppStrings.details.tr(), style: AppTextStyle.iBMP24w600),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(12).r,
            color: Color(0xffF2F5F9),
            child: Icon(Icons.close),
          ),
        ),
      ),
      body: SingleChildScrollView(child: DetailSalaryBodyWidget()),
    );
  }
}

