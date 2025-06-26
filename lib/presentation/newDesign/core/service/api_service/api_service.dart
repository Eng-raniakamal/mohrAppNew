import 'package:dio/dio.dart';
import 'package:essmohr/presentation/newDesign/core/error/exception.dart';

import 'dio_helper.dart';

class ApiService {

  final DioHelper dioHelper;
  ApiService({required this.dioHelper}) ;




  Future<Response> getRequest({required String endPoint, Map<String, dynamic>? queryParams}) async {
    final uri = Uri.parse(endPoint).replace(queryParameters: queryParams);
    final response = await dioHelper.dio.get(uri.toString(), );

    if (response.statusCode == 200) return response;
    throw ServerException();
  }

  Future<Response> postRequest({required String endPoint, dynamic data}) async {
    final response = await dioHelper.dio.post(endPoint, data: data, );

    if (response.statusCode == 200 || response.statusCode == 201) return response;
    throw ServerException();
  }

  Future<Response> putRequest({required String endPoint, dynamic data}) async {
    final response = await dioHelper.dio.put(endPoint, data: data);

    if (response.statusCode == 200 || response.statusCode == 201) return response;
    throw ServerException();
  }

  Future<Response> deleteRequest({required String endPoint, dynamic data}) async {
    final response = await dioHelper.dio.delete(endPoint, data: data);

    if (response.statusCode == 200 || response.statusCode == 204) return response;
    throw ServerException();
  }
}
