import 'package:essmohr/presentation/newDesign/core/service/api_service/api_service.dart';
import 'package:essmohr/presentation/newDesign/core/service/api_service/dio_helper.dart';

import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/export_file/package_export.dart';
//
import '../../../../../application/di.dart';
import 'depend_inject.dart';


void initApi() {

  instance.registerLazySingleton<ApiService>(
        () => ApiService(dioHelper: instance<DioHelper>()),
  );

}
