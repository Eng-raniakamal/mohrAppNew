import '../../../../../application/di.dart';
import '../../../feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import '../../../feature/vacation/domain/use_case/get_vacation_entitlements_use_case.dart';
import '../../../feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';


void initUseCases() {
  instance.registerLazySingleton(() => GetVacationTypeUseCase(instance()));
  instance.registerLazySingleton(() => GetDefaultReviewerUseCase(instance()));
  instance.registerLazySingleton(() => PostVacationUseCase(instance()));
  instance.registerLazySingleton(() => CalculateVacationDurationUseCase(instance()));
  instance.registerLazySingleton(() => ValidateVacationUseCase(instance()));
  instance.registerLazySingleton(() => CheckHandledAlertsUseCase(instance()));
  instance.registerLazySingleton(() => GetVacationBalanceUseCase(instance()));
  instance.registerLazySingleton(() => GetVacationEntitlementsUseCase(instance()));
  instance.registerLazySingleton<GetEmployeeVacationsUseCase>(
        () {
          return GetEmployeeVacationsUseCase(instance());
        }, // instance<VacationRepository>
  );


  instance.registerLazySingleton<GetVacationRequestsUseCase>(
        () => GetVacationRequestsUseCase(
      instance<VacationRepository>(), // تأكد أن VacationRepository مسجَّل في initRepositories()
    ),
  );
}
