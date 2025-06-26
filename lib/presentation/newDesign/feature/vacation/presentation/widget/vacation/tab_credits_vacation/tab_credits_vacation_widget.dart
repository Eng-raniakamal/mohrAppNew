import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_state.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/tab_credits_vacation/item_of_tab_credits_vacation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCreditsVacationWidget extends StatelessWidget {
  const TabCreditsVacationWidget({super.key});

  static final List<ReportModel> listManagement = [
    ReportModel(
      nameReport: "عارضة",
      isCertified: true,
      dateRequest: " 30 ديسمبر 2023",
    ),
    ReportModel(
      nameReport: "مرضى",
      dateRequest: " 30 ديسمبر 2023",
      isCertified: true,
    ),
    ReportModel(
      nameReport: "اعتيادى",
      dateRequest: " 30 ديسمبر 2023",
      isRejected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
        GetVacationRequestsCubit,
        GetVacationRequestsResponseState>(
      builder: (context, state) {
        if (state.isLoading == true && state.response == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage != null) {
          return const Center(child: Text(" معتمدة لا توجد طلبات إجازة"));
        }
        if (state.response != null && state.response!.isNotEmpty) {
          return Column(
            children: [
              Column(
                children:
                state.response!
                    .map((e) => ItemOfTabCreditsVacationWidget(model:e))
                    .toList(),
              ),


            ],

          );
        }
        return Text("لا يوجد طلبات قيد الاعتماد");
      },
    );
  }
}
