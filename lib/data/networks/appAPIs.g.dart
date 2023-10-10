// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appAPIs.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

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
    String email,
    String password,
    String deviceId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'UserName': email,
      'Password': password,
      'DeviceId': deviceId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Account/VerifyLogin',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AuthenticationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserProfileResponse> getUserDataResponse(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserProfileResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = UserProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserImageResponse> getUserImageResponse(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserImageResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/Avatar',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = UserImageResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BasicDataResponse> DisplayBasicData(
    String? userId,
    int? empId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'UserId': userId,
      'Id': empId,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BasicDataResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetPersonellData',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BasicDataResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetEmpSkillsResponse> DisplaySkills(
    String? userId,
    int? empId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'UserId': userId,
      'Id': empId,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetEmpSkillsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetEmployeeSkills',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetEmpSkillsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetAcademicDegreeResponse> DisplayAcademicDegree(
    String? userId,
    int? empId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'UserId': userId,
      'Id': empId,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetAcademicDegreeResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetEmployeeAcademicDegrees',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetAcademicDegreeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<QualificationsResponse> getQualifications(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<QualificationsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetQualificationsLookup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = QualificationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GradesResponse> getGrades(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<GradesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetGradesLookup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GradesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VacationsResponse> getVacations(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<VacationsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetVacations',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = VacationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VacationTypeResponse> getVacationType() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<VacationTypeResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetVacationTypes',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = VacationTypeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SalaryResponse> getSalary(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<SalaryResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetSalaries',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SalaryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SalaryDetailsResponse> getSalaryDetails(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SalaryDetailsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetSalary/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SalaryDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AttendanceResponse> getAttendance(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AttendanceResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Attendance?fromDate=',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AttendanceResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmployeeBasicDataResponse> SaveEmployeBasicData(
    String userId,
    EmployeeSaveResponse employee,
    AddressSaveResponse address,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'userId': userId};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'Employee': employee,
      'Address': address,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmployeeBasicDataResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/PersonellData',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = EmployeeBasicDataResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<saveEmpSkillsResponse> saveEmployeeSkillResponse(
    String userId,
    String date,
    int gradeId,
    int qualificationTypeId,
    int employeeId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'UserId': userId};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'Date': date,
      'GradeId': gradeId,
      'QualificationTypeId': qualificationTypeId,
      'EmployeeId': employeeId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<saveEmpSkillsResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Skills',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = saveEmpSkillsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<saveAcademicDegreeResponse> saveAcademicDegree(
    String userId,
    int id,
    String major,
    String university,
    String notes,
    int employeeId,
    int academicDegreeTypeId,
    int gradeId,
    String degreeDate,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'UserId': userId,
      'Id': id,
      'Major': major,
      'University': university,
      'Notes': notes,
      'EmployeeId': employeeId,
      'AcademicDegreeTypeId': academicDegreeTypeId,
      'GradeId': gradeId,
      'DegreeDate': degreeDate,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<saveAcademicDegreeResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/AcademicDegrees',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = saveAcademicDegreeResponse.fromJson(_result.data!);
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
