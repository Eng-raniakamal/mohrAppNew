import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/header_home_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/last_salary_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/no_report_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget.dart';

import '../../../../../application/app_prefs.dart';
import '../../../../../application/constants.dart';
import '../../../../../application/di.dart';
import '../../../../../domain/model/model.dart';
import '../../../../User/User_viewModel.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final EmployeeViewModel _viewModel = instance<EmployeeViewModel>();
  //final EmployeeImageViewModel _imageViewModel = instance<EmployeeImageViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();


  @override
  Widget build(BuildContext context) {

  //  _getEmployeeData(userData)
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderHomeWidget(title: "اسلام هاني"),
              NoReportWidget(),
              // ReportWidget(
              //   typeReport: "تقرير الطلبات",
              //   nameReport: "طلب سلفة",
              //   isRequestAdvance: true,
              //   isCertified: true,
              //   numberOfInstallments: 3,
              //   amount: 234,
              //   not: "تقبل الله منكم الحج وقد تم اعتماد الاجازة",
              // ),
              // ReportWidget(
              //   typeReport: "تقرير الاجازات",
              //   nameReport: "اجازة مرضية",
              //   isUnderReview: true,
              //   isSickLeave: true,
              //   numberOfInstallments: 2,
              //   amount: 20,
              // ),
              SizedBox(height: 20),
              LastSalaryWidget()
            ],
          ),
        ),
      ),
    );
  }
}

