import 'package:essmohr/presentation/newDesign/core/component/header_core_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/vacation_report_widget.dart';

class TabAllVacationWidget extends StatelessWidget {
  TabAllVacationWidget({super.key});

  final List<ReportModel> reportModel = [
    ReportModel(
      appBarTitle: "اجازة مرضية",
      nameReport: "اجازة مرضية",
      isUnderReview: true,
      numberOfInstallments: 3,
      isSickLeave: true,
      amount: 234,
      typeReport:"اجازة مرضية",
      dateRequest: "22 نوفمبر2024",
      duration: "12 يوم"
    ),
    ReportModel(
      appBarTitle: "اجازة حج",

      nameReport: "اجازة حج",
      isUnderReview: true,
      numberOfInstallments: 3,
      isSickLeave: true,
      amount: 234,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCoreWidget(title: "جميع الاجازات", subTitle: "الترتيب حسب"),
        SizedBox(height: 12.h),
        Column(
          children:
              reportModel
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        context.read<VacationCubit>().changeTab(3);
                        context.read<VacationCubit>().setReportModel(e);
                      },
                      child: ItemTabAllVacationWidget(reportModel: e),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
