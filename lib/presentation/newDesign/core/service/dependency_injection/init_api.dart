import 'package:essmohr/presentation/newDesign/core/service/api_service/api_service.dart';
import 'package:essmohr/presentation/newDesign/core/service/api_service/dio_helper.dart';

import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/export_file/package_export.dart';
//
import 'depend_inject.dart';


void initApi() {

  sl.registerLazySingleton<ApiService>(
        () => ApiService(dioHelper: sl<DioHelper>()),
  );

}
