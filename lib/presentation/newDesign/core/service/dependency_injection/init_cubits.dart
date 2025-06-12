import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initCubits() {
  sl.registerFactory(() => FilePickerCubit());
  sl.registerFactory(() => VacationTypeCubit(sl(), sl()));
  sl.registerFactory(() => DefaultReviewerCubit(sl()));
  sl.registerFactory(() => PostVacationCubit(sl()));
  sl.registerFactory(() => CalculateVacationDurationCubit(sl()));
  sl.registerFactory(() => DateCubit());
  sl.registerFactory(() => ValidateVacationCubit(sl()));
  sl.registerFactory(() => CheckHandledAlertsCubit(sl()));
  sl.registerFactory(() => VacationCubit());
  sl.registerFactory(() => VacationBalanceCubit(sl()));
  sl.registerFactory(() => SubmitVacationRequestCubit(
    calculateVacationDurationCubit: sl(),
    validateCubit: sl(),
    alertsCubit: sl(),
    postVacationCubit: sl(),
  ));
  sl.registerFactory(() => ConnectInternetCubit());
}
