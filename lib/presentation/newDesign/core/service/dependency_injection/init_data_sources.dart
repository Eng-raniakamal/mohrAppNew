import 'export_file/package_export.dart';
import 'depend_inject.dart';



void initDataSources() {
  sl.registerLazySingleton<VacationRemoteDataSource>(
        () => VacationRemoteImplDio(apiService: sl<ApiService>()),
  );
}
