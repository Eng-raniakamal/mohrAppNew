import '../../../../../application/di.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';



void initDataSources() {
  instance.registerLazySingleton<VacationRemoteDataSource>(
        () => VacationRemoteImplDio(apiService: instance<ApiService>()),
  );

}
