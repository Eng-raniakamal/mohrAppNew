// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appAPIs.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://mohrapi.azurewebsites.net';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthenticationResponse> login(
    email,
    password,
    deviceId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'UserName': email,
      'Password': password,
      'DeviceId': deviceId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationResponse>(Options(
      method: 'POST',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Account/VerifyLogin',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserProfileResponse> getUserDataResponse(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserProfileResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VacationsResponse> getVacations(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<VacationsResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetVacations',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VacationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmployeeBasicDataResponse> getEmployeBasicDataResponse(
    userId,
    ArabicName,
    EnglishName,
    BirthDate,
    NationalId,
    SocialId,
    Email,
    Phone,
    Emergency_Number,
    AddressText,
    DistrictId,
    PoBox,
    ZipCode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'UserId': userId,
      'ArabicName': ArabicName,
      'EnglishName': EnglishName,
      'BirthDate': BirthDate,
      'NationalId': NationalId,
      'SocialId': SocialId,
      'Email': Email,
      'Phone': Phone,
      'EmergencyNumber': Emergency_Number,
      'AddressText': AddressText,
      'DistrictId': DistrictId,
      'PoBox': PoBox,
      'ZipCode': ZipCode,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmployeeBasicDataResponse>(Options(
      method: 'POST',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/PersonellData',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmployeeBasicDataResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmployeeSkillsResponse> getEmployeeSkillResponse(
    userId,
    date,
    gradeId,
    qualificationTypeId,
    employeeId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'UserId': userId,
      'Date': date,
      'GradeId': gradeId,
      'QualificationTypeId': qualificationTypeId,
      'EmployeeId': employeeId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmployeeSkillsResponse>(Options(
      method: 'POST',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Skills',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmployeeSkillsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
