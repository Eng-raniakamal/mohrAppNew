import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ErrorHandler {
  static String getErrorMessage(DioException error) {
    try {
      if (error.response != null && error.response?.data != null) {
        final data = error.response?.data;

        if (data is Map<String, dynamic> && data.containsKey('message')) {
          return data['message'].toString();
        }

        return data.toString();
      }

      return error.message ?? "فشل الاتصال بالخادم";
    } catch (_) {
      return "فشل في معالجة الخطأ من الخادم";
    }
  }
}
