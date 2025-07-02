import 'package:dio/dio.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/newDesign/core/service/api_service/dio_helper.dart';
import '../../../../../application/app_prefs.dart';
import '../../../../../application/di.dart';
import '../../../../Attendance/view/attendanceAlert.dart';
import 'depend_inject.dart';
import '../../../../../../application/di.dart';



final AppPreferences _appPreferences = instance<AppPreferences>();
String? userId;
Future<String> getUserId ()
async => userId=await _appPreferences.getUserToken();
void initCore() {
  getUserId ();
   instance.registerLazySingleton(() => Dio());



  //instance.registerLazySingleton<String>(() => "5428d833-0d7d-43d1-84fc-1ace00723492");
  // instance.registerLazySingleton<String>(() => userId!);
  instance.registerLazySingleton<String>(() => Constants.userId);

  instance.registerLazySingleton<DioHelper>(
        () => DioHelper(userId: instance<String>(), dio: instance<Dio>()),
  );

}
