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
  Future<BasicDataResponse> DisplayBasicData(
    userId,
    empId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': userId,
      'Id': empId,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BasicDataResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetPersonellData',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BasicDataResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetEmpSkillsResponse> DisplaySkills(
    userId,
    empId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': userId,
      'Id': empId,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetEmpSkillsResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetEmployeeSkills',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetEmpSkillsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetAcademicDegreeResponse> DisplayAcademicDegree(
    userId,
    empId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': userId,
      'Id': empId,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetAcademicDegreeResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetEmployeeAcademicDegrees',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetAcademicDegreeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<QualificationsResponse> getQualifications(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio.fetch<List< dynamic>>(
        _setStreamType<QualificationsResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetQualificationsLookup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QualificationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GradesResponse> getGrades(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<List< dynamic> >(_setStreamType<GradesResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetGradesLookup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GradesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VacationsResponse> getVacations(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<List< dynamic>>(_setStreamType<VacationsResponse>(Options(
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
  Future<SalaryResponse> getSalary(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio
        .fetch<List< dynamic>>(_setStreamType<SalaryResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetSalaries',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SalaryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SalaryDetailsResponse> getSalaryDetails(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'UserId': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SalaryDetailsResponse>(Options(
      method: 'GET',
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/GetSalary/'+ Constants.salaryDetailsId ,
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SalaryDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmployeeBasicDataResponse> SaveEmployeBasicData(
    userId,
    employee,
    address,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'UserId': userId,
      'Employee': employee,
      'Address': address,
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
  Future<saveEmpSkillsResponse> saveEmployeeSkillResponse(
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
        _setStreamType<saveEmpSkillsResponse>(Options(
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
    final value = saveEmpSkillsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<saveAcademicDegreeResponse> saveAcademicDegree(
    userId,
    id,
    major,
    university,
    notes,
    employeeId,
    academicDegreeTypeId,
    gradeId,
    degreeDate,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
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
      headers: <String, dynamic>{},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://mohrapi.azurewebsites.net/api/Employee/AcademicDegrees',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
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
}
