import '../../../../../application/di.dart';
import '../../../feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import '../../../feature/vacation/presentation/control/get_vacation_requests/get_vacation_requests_cubit.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initCubits() {
  instance.registerFactory(() => FilePickerCubit());
  instance.registerFactory(() => VacationCubit());
  instance.registerFactory(() => VacationTypeCubit(instance(), instance()));
  instance.registerFactory(() => DefaultReviewerCubit(instance()));
  instance.registerFactory(() => PostVacationCubit(instance()));
  instance.registerFactory(() => CalculateVacationDurationCubit(instance()));
  instance.registerFactory(() => DateCubit());
  instance.registerFactory(() => ValidateVacationCubit(instance()));
  instance.registerFactory(() => CheckHandledAlertsCubit(instance()));
  //instance.registerFactory(() => VacationCubit());
  instance.registerFactory<GetEmployeeVacationsCubit>(() {
    return GetEmployeeVacationsCubit(
      getEmployeeVacationsUseCase: instance(),
      appPreferences: instance(), // ← أضف هذا السطر
    );
  });


  // تسجيل GetVacationRequestsCubit
  instance.registerFactory<GetVacationRequestsCubit>(
        () => GetVacationRequestsCubit(
      getVacationRequestsUseCase: instance(), // تأكد أن UseCase مسجل في initUseCases()
    ),
  );

  // instance.registerFactory<GetEmployeeVacationsCubit>(
  //       () {
  //     print('✅ GetEmployeeVacationsCubit registered');
  //     GetEmployeeVacationsCubit(getEmployeeVacationsUseCase: instance());
  //   },
  // );
 // instance.registerFactory(() => GetEmployeeVacationsCubit(instance(), getEmployeeVacationsUseCase: null));
  instance.registerFactory(() => VacationBalanceCubit(instance()));
  instance.registerFactory(() => SubmitVacationRequestCubit(
    calculateVacationDurationCubit: instance(),
    validateCubit: instance(),
    alertsCubit: instance(),
    postVacationCubit: instance(),
  ));
  instance.registerFactory(() => ConnectInternetCubit());
}
