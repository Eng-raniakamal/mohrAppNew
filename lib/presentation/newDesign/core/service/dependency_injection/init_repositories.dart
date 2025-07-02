import '../../../../../application/di.dart';
import 'export_file/package_export.dart';
import 'depend_inject.dart';

void initRepositories() {
  instance.registerLazySingleton<VacationRepository>(
        () => VacationRepositoryImpl(
      vacationRemoteDataSource: instance(),
   ),
 );
}
