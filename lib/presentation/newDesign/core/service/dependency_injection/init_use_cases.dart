import '../../../feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import '../../../feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';
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
  sl.registerLazySingleton<GetEmployeeVacationsUseCase>(
        () {
          return GetEmployeeVacationsUseCase(sl());
        }, // sl<VacationRepository>
  );


  sl.registerLazySingleton<GetVacationRequestsUseCase>(
        () => GetVacationRequestsUseCase(
      sl<VacationRepository>(), // تأكد أن VacationRepository مسجَّل في initRepositories()
    ),
  );
}
