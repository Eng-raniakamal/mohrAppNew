import 'package:dio/dio.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/newDesign/core/utils/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  final String userId;
  final Dio dio;

  DioHelper({required this.userId, required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: EndPoint.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "userId": Constants.userId,
        "Accept-Language":'ar' //---------- app language -------------------
      },
    );

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["userId"] = userId;
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (e, handler) => handler.next(e),
      ),
    ]);
  }
}
