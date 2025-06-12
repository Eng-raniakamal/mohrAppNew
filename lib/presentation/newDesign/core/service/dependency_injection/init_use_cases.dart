import 'export_file/package_export.dart';
import 'depend_inject.dart';


void initUseCases() {
  sl.registerLazySingleton(() => GetVacationTypeUseCase(sl()));
  sl.registerLazySingleton(() => GetDefaultReviewerUseCase(sl()));
  sl.registerLazySingleton(() => PostVacationUseCase(sl()));
  sl.registerLazySingleton(() => CalculateVacationDurationUseCase(sl()));
  sl.registerLazySingleton(() => ValidateVacationUseCase(sl()));
  sl.registerLazySingleton(() => CheckHandledAlertsUseCase(sl()));
  sl.registerLazySingleton(() => GetVacationBalanceUseCase(sl()));
}
