import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/depend_inject.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/submit_vacation_request/submit_vacation_request_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/submit_vacation_request/submit_vacation_request_state.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_request/vacation_request_body_widget.dart';
import '../../../../layout/export_layout_file.dart';
import '../../control/vacation_tab/vacation_tab_cubit.dart';

class VacationRequestWidget extends StatelessWidget {
  const VacationRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SubmitVacationRequestCubit>(),

      child: Builder(
          builder: (context) {
            return BlocConsumer<
                SubmitVacationRequestCubit,
                SubmitVacationRequestState
            >(
              listener: (context, state) {
                if (state is SubmitLoading) {
                  Center(child: CircularProgressIndicator());
                }

                  if (state is SubmitError) {
                  context.showErrorDialog(state.message);
                      // context.showSnackBar(
                      //   "لم يتم تقديم الطلب ",
                      //   backgroundColor: Colors.red,
                      // );
                }

                //   if (state is SubmitAlertsChecked) {
                //   context.showSnackBar(
                //     "لم يتم تقديم الطلب ",
                //     backgroundColor: Colors.red,
                //   );
                // }

                  if (state is SubmitSuccess) {
                  context.read<VacationCubit>().changeTab(0);
                  context.showSnackBar(
                    "تم تقديم الطلب بنجاح",
                    backgroundColor: Colors.green,
                  );
                }
              },
              builder: (context, state) {
                return VacationRequestBodyWidget();
              },
            );
          }
      ),
    );
  }
}
