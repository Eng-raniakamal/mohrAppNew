import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initRepositories() {
  sl.registerLazySingleton<VacationRepository>(
        () => VacationRepositoryImpl(
      vacationRemoteDataSource: sl(),
    ),
  );
}
