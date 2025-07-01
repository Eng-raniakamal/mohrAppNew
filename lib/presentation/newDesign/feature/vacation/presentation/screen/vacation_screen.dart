import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import '../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';
import '../control/approve_cancel_request/approve_cancel_request_cubit.dart';
import '../control/get_employee_vacations/get_employee_vacations_state.dart';
import 'import_file.dart';

class VacationScreen extends StatelessWidget {
  const VacationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: functionBlocProvider(),
    //   child: BlocBuilder<VacationCubit, int>(
    //     builder: (context, state) {
    //       int stateIndex = state;
    //       return Padding(
    //         padding: const EdgeInsets.all(20.0).r,
    //         child: BlocBuilder<GetEmployeeVacationsCubit, GetEmployeeVacationsState>(
    //           builder: (context, state) {
    //             if (state.isLoading == true && state.response == null) {
    //               return const Center(child: CircularProgressIndicator());
    //             }
    //             if (state.errorMessage != null) {
    //               return Center(child: Text(state.errorMessage!));
    //             }
    //             List<GetEmployeeVacationsResponseModel> vacations = state.response ?? [];
    //
    //             return SingleChildScrollView(
    //               child: () {
    //                 if (stateIndex == 1) {
    //                   return VacationRequestWidget();
    //                 }   else if (stateIndex == 3) {
    //                   return VacationDetailsWidget();
    //                 }
    //
    //
    //                 else if (vacations.isEmpty) {
    //                   return NoVacationWidget();
    //                 }
    //
    //                 else {
    //                   return const BodyTabWidget();
    //                 }
    //               }(),
    //             );
    //
    //           },
    //         ),
    //       );
    //     },
    //   ),
    // );

    return MultiBlocProvider(
      providers: functionBlocProvider(),
      child: Builder( // 👈 نستخدم Builder حتى نضمن أن BlocProvider فعّال أولاً
        builder: (context) {
          return BlocBuilder<VacationCubit, int>(
            builder: (context, state) {
              int stateIndex = state;
              return Padding(
                padding: const EdgeInsets.all(20.0).r,
                child: BlocBuilder<GetEmployeeVacationsCubit, GetEmployeeVacationsState>(
                  builder: (context, state) {
                    if (state.isLoading == true && state.response == null) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.errorMessage != null) {
                      return Center(child: Text(state.errorMessage!));
                    }

                    List<GetEmployeeVacationsResponseModel> vacations = state.response ?? [];

                    return SingleChildScrollView(
                      child: () {
                        if (stateIndex == 1) {
                          return VacationRequestWidget();
                        } else if (stateIndex == 3) {
                          return VacationDetailsWidget();
                        }
                        // else if (vacations.isEmpty) {
                        //   return NoVacationWidget();
                        // } else {
                          return const BodyTabWidget();

                      }(),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  functionBlocProvider() {
    return [
      BlocProvider(create: (context) => sl<VacationCubit>()),
      BlocProvider(create: (context) => VacationTabCubit()),
      BlocProvider(
        create: (context) => sl<VacationTypeCubit>()..fetchVacationTypes(),
      ),
      BlocProvider(
        create:
            (context) => sl<DefaultReviewerCubit>()..fetchDefaultReviewers(),
      ),
      BlocProvider(create: (context) => sl<PostVacationCubit>()),
      BlocProvider(create: (context) => sl<CalculateVacationDurationCubit>()),
      BlocProvider(create: (context) => sl<DateCubit>()),
      BlocProvider(create: (context) => sl<ValidateVacationCubit>()),
      BlocProvider(create: (context) => sl<CheckHandledAlertsCubit>()),
      BlocProvider(
        create:
            (context) {
              return sl<GetEmployeeVacationsCubit>()..getEmployeeVacations();
            },
      ),
      BlocProvider(
        create:
            (context) => sl<GetVacationRequestsCubit>()..getVacationRequests(),
      ),
      BlocProvider(
        create:
            (context) => sl<ApproveCancelRequestCubit>(),
      ),

    ];
  }
}
