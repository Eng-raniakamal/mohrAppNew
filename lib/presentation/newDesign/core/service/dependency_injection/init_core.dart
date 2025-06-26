import 'package:dio/dio.dart';
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



  sl.registerLazySingleton<String>(() => "cf92e40e-1bff-4b40-886e-badb7bebe638");
 // sl.registerLazySingleton<String>(() => userId!);

  sl.registerLazySingleton<DioHelper>(
        () => DioHelper(userId: sl<String>(), dio: sl<Dio>()),
 );



}
