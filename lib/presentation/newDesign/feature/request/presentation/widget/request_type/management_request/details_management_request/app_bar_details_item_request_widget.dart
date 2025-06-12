import 'package:essmohr/presentation/newDesign/core/utils/app_string.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarDetailsItemRequestWidget extends StatelessWidget {
  const AppBarDetailsItemRequestWidget({super.key, required this.reportModel});

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarManagementRequestWidget(
          title: reportModel.appBarTitle??AppString.requestAdministrativeDetails,
          onTap: () {
            context.read<TabSwitcherCubit>().changeTab(0);
          },
        ),
        ReportStatusWidget(reportModel: reportModel, isDetailsScreen: true),
      ],
    );
  }
}
