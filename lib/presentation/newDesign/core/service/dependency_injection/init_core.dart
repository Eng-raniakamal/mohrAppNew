import 'package:dio/dio.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/newDesign/core/service/api_service/dio_helper.dart';
import '../../../../../application/app_prefs.dart';
import '../../../../../application/di.dart';
import '../../../../Attendance/view/attendanceAlert.dart';
import 'depend_inject.dart';

final AppPreferences _appPreferences = instance<AppPreferences>();
String? userId;
Future<String> getUserId ()
async => userId=await _appPreferences.getUserToken();
void initCore() {
  getUserId ();
  sl.registerLazySingleton(() => Dio());



  sl.registerLazySingleton<String>(() => "5428d833-0d7d-43d1-84fc-1ace00723492");
 // sl.registerLazySingleton<String>(() => userId!);
 // sl.registerLazySingleton<String>(() => Constants.userId);

  sl.registerLazySingleton<DioHelper>(
        () => DioHelper(userId: sl<String>(), dio: sl<Dio>()),
 );

}
