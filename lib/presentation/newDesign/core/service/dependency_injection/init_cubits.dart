import '../../../feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import '../../../feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initCubits() {
  sl.registerFactory(() => FilePickerCubit());
  sl.registerFactory(() => VacationCubit());
  sl.registerFactory(() => VacationTypeCubit(sl(), sl()));
  sl.registerFactory(() => DefaultReviewerCubit(sl()));
  sl.registerFactory(() => PostVacationCubit(sl()));
  sl.registerFactory(() => CalculateVacationDurationCubit(sl()));
  sl.registerFactory(() => DateCubit());
  sl.registerFactory(() => ValidateVacationCubit(sl()));
  sl.registerFactory(() => CheckHandledAlertsCubit(sl()));
  //sl.registerFactory(() => VacationCubit());
  sl.registerFactory<GetEmployeeVacationsCubit>(
        () {
          print('✅ GetEmployeeVacationsCubit registered');
          return GetEmployeeVacationsCubit(getEmployeeVacationsUseCase: sl());
        },
  );

  // تسجيل GetVacationRequestsCubit
  sl.registerFactory<GetVacationRequestsCubit>(
        () => GetVacationRequestsCubit(
      getVacationRequestsUseCase: sl(), // تأكد أن UseCase مسجل في initUseCases()
    ),
  );

  // sl.registerFactory<GetEmployeeVacationsCubit>(
  //       () {
  //     print('✅ GetEmployeeVacationsCubit registered');
  //     GetEmployeeVacationsCubit(getEmployeeVacationsUseCase: sl());
  //   },
  // );
 // sl.registerFactory(() => GetEmployeeVacationsCubit(sl(), getEmployeeVacationsUseCase: null));
  sl.registerFactory(() => VacationBalanceCubit(sl()));
  sl.registerFactory(() => SubmitVacationRequestCubit(
    calculateVacationDurationCubit: sl(),
    validateCubit: sl(),
    alertsCubit: sl(),
    postVacationCubit: sl(),
  ));
  sl.registerFactory(() => ConnectInternetCubit());
}
