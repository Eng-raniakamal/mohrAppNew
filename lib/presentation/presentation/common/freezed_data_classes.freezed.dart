// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password, String deviceId});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String deviceId});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? deviceId = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.email, this.password, this.deviceId);

  @override
  final String email;
  @override
  final String password;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(
          final String email, final String password, final String deviceId) =
      _$LoginObjectImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserObject {
  String get userID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserObjectCopyWith<UserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserObjectCopyWith<$Res> {
  factory $UserObjectCopyWith(
          UserObject value, $Res Function(UserObject) then) =
      _$UserObjectCopyWithImpl<$Res, UserObject>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class _$UserObjectCopyWithImpl<$Res, $Val extends UserObject>
    implements $UserObjectCopyWith<$Res> {
  _$UserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserObjectImplCopyWith<$Res>
    implements $UserObjectCopyWith<$Res> {
  factory _$$UserObjectImplCopyWith(
          _$UserObjectImpl value, $Res Function(_$UserObjectImpl) then) =
      __$$UserObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$UserObjectImplCopyWithImpl<$Res>
    extends _$UserObjectCopyWithImpl<$Res, _$UserObjectImpl>
    implements _$$UserObjectImplCopyWith<$Res> {
  __$$UserObjectImplCopyWithImpl(
      _$UserObjectImpl _value, $Res Function(_$UserObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$UserObjectImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserObjectImpl implements _UserObject {
  _$UserObjectImpl(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'UserObject(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserObjectImpl &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserObjectImplCopyWith<_$UserObjectImpl> get copyWith =>
      __$$UserObjectImplCopyWithImpl<_$UserObjectImpl>(this, _$identity);
}

abstract class _UserObject implements UserObject {
  factory _UserObject(final String userID) = _$UserObjectImpl;

  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$UserObjectImplCopyWith<_$UserObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$gradeObject {
  String get userID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $gradeObjectCopyWith<gradeObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $gradeObjectCopyWith<$Res> {
  factory $gradeObjectCopyWith(
          gradeObject value, $Res Function(gradeObject) then) =
      _$gradeObjectCopyWithImpl<$Res, gradeObject>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class _$gradeObjectCopyWithImpl<$Res, $Val extends gradeObject>
    implements $gradeObjectCopyWith<$Res> {
  _$gradeObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$gradeObjectImplCopyWith<$Res>
    implements $gradeObjectCopyWith<$Res> {
  factory _$$gradeObjectImplCopyWith(
          _$gradeObjectImpl value, $Res Function(_$gradeObjectImpl) then) =
      __$$gradeObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$gradeObjectImplCopyWithImpl<$Res>
    extends _$gradeObjectCopyWithImpl<$Res, _$gradeObjectImpl>
    implements _$$gradeObjectImplCopyWith<$Res> {
  __$$gradeObjectImplCopyWithImpl(
      _$gradeObjectImpl _value, $Res Function(_$gradeObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$gradeObjectImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$gradeObjectImpl implements _gradeObject {
  _$gradeObjectImpl(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'gradeObject(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$gradeObjectImpl &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$gradeObjectImplCopyWith<_$gradeObjectImpl> get copyWith =>
      __$$gradeObjectImplCopyWithImpl<_$gradeObjectImpl>(this, _$identity);
}

abstract class _gradeObject implements gradeObject {
  factory _gradeObject(final String userID) = _$gradeObjectImpl;

  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$gradeObjectImplCopyWith<_$gradeObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VacationsObjects {
  String get userID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VacationsObjectsCopyWith<VacationsObjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacationsObjectsCopyWith<$Res> {
  factory $VacationsObjectsCopyWith(
          VacationsObjects value, $Res Function(VacationsObjects) then) =
      _$VacationsObjectsCopyWithImpl<$Res, VacationsObjects>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class _$VacationsObjectsCopyWithImpl<$Res, $Val extends VacationsObjects>
    implements $VacationsObjectsCopyWith<$Res> {
  _$VacationsObjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VacationObjectsImplCopyWith<$Res>
    implements $VacationsObjectsCopyWith<$Res> {
  factory _$$VacationObjectsImplCopyWith(_$VacationObjectsImpl value,
          $Res Function(_$VacationObjectsImpl) then) =
      __$$VacationObjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$VacationObjectsImplCopyWithImpl<$Res>
    extends _$VacationsObjectsCopyWithImpl<$Res, _$VacationObjectsImpl>
    implements _$$VacationObjectsImplCopyWith<$Res> {
  __$$VacationObjectsImplCopyWithImpl(
      _$VacationObjectsImpl _value, $Res Function(_$VacationObjectsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$VacationObjectsImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VacationObjectsImpl implements _VacationObjects {
  _$VacationObjectsImpl(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'VacationsObjects(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacationObjectsImpl &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VacationObjectsImplCopyWith<_$VacationObjectsImpl> get copyWith =>
      __$$VacationObjectsImplCopyWithImpl<_$VacationObjectsImpl>(
          this, _$identity);
}

abstract class _VacationObjects implements VacationsObjects {
  factory _VacationObjects(final String userID) = _$VacationObjectsImpl;

  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$VacationObjectsImplCopyWith<_$VacationObjectsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalaryObjects {
  String get userID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalaryObjectsCopyWith<SalaryObjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryObjectsCopyWith<$Res> {
  factory $SalaryObjectsCopyWith(
          SalaryObjects value, $Res Function(SalaryObjects) then) =
      _$SalaryObjectsCopyWithImpl<$Res, SalaryObjects>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class _$SalaryObjectsCopyWithImpl<$Res, $Val extends SalaryObjects>
    implements $SalaryObjectsCopyWith<$Res> {
  _$SalaryObjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryObjectsImplCopyWith<$Res>
    implements $SalaryObjectsCopyWith<$Res> {
  factory _$$SalaryObjectsImplCopyWith(
          _$SalaryObjectsImpl value, $Res Function(_$SalaryObjectsImpl) then) =
      __$$SalaryObjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$SalaryObjectsImplCopyWithImpl<$Res>
    extends _$SalaryObjectsCopyWithImpl<$Res, _$SalaryObjectsImpl>
    implements _$$SalaryObjectsImplCopyWith<$Res> {
  __$$SalaryObjectsImplCopyWithImpl(
      _$SalaryObjectsImpl _value, $Res Function(_$SalaryObjectsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$SalaryObjectsImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SalaryObjectsImpl implements _SalaryObjects {
  _$SalaryObjectsImpl(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'SalaryObjects(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryObjectsImpl &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryObjectsImplCopyWith<_$SalaryObjectsImpl> get copyWith =>
      __$$SalaryObjectsImplCopyWithImpl<_$SalaryObjectsImpl>(this, _$identity);
}

abstract class _SalaryObjects implements SalaryObjects {
  factory _SalaryObjects(final String userID) = _$SalaryObjectsImpl;

  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$SalaryObjectsImplCopyWith<_$SalaryObjectsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalaryDetailsObjects {
  String get userID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalaryDetailsObjectsCopyWith<SalaryDetailsObjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryDetailsObjectsCopyWith<$Res> {
  factory $SalaryDetailsObjectsCopyWith(SalaryDetailsObjects value,
          $Res Function(SalaryDetailsObjects) then) =
      _$SalaryDetailsObjectsCopyWithImpl<$Res, SalaryDetailsObjects>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class _$SalaryDetailsObjectsCopyWithImpl<$Res,
        $Val extends SalaryDetailsObjects>
    implements $SalaryDetailsObjectsCopyWith<$Res> {
  _$SalaryDetailsObjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryDetailsObjectsImplCopyWith<$Res>
    implements $SalaryDetailsObjectsCopyWith<$Res> {
  factory _$$SalaryDetailsObjectsImplCopyWith(_$SalaryDetailsObjectsImpl value,
          $Res Function(_$SalaryDetailsObjectsImpl) then) =
      __$$SalaryDetailsObjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$SalaryDetailsObjectsImplCopyWithImpl<$Res>
    extends _$SalaryDetailsObjectsCopyWithImpl<$Res, _$SalaryDetailsObjectsImpl>
    implements _$$SalaryDetailsObjectsImplCopyWith<$Res> {
  __$$SalaryDetailsObjectsImplCopyWithImpl(_$SalaryDetailsObjectsImpl _value,
      $Res Function(_$SalaryDetailsObjectsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$SalaryDetailsObjectsImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SalaryDetailsObjectsImpl implements _SalaryDetailsObjects {
  _$SalaryDetailsObjectsImpl(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'SalaryDetailsObjects(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryDetailsObjectsImpl &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryDetailsObjectsImplCopyWith<_$SalaryDetailsObjectsImpl>
      get copyWith =>
          __$$SalaryDetailsObjectsImplCopyWithImpl<_$SalaryDetailsObjectsImpl>(
              this, _$identity);
}

abstract class _SalaryDetailsObjects implements SalaryDetailsObjects {
  factory _SalaryDetailsObjects(final String userID) =
      _$SalaryDetailsObjectsImpl;

  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$SalaryDetailsObjectsImplCopyWith<_$SalaryDetailsObjectsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendanceObjects {
  String get userID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceObjectsCopyWith<AttendanceObjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceObjectsCopyWith<$Res> {
  factory $AttendanceObjectsCopyWith(
          AttendanceObjects value, $Res Function(AttendanceObjects) then) =
      _$AttendanceObjectsCopyWithImpl<$Res, AttendanceObjects>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class _$AttendanceObjectsCopyWithImpl<$Res, $Val extends AttendanceObjects>
    implements $AttendanceObjectsCopyWith<$Res> {
  _$AttendanceObjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceObjectsImplCopyWith<$Res>
    implements $AttendanceObjectsCopyWith<$Res> {
  factory _$$AttendanceObjectsImplCopyWith(_$AttendanceObjectsImpl value,
          $Res Function(_$AttendanceObjectsImpl) then) =
      __$$AttendanceObjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$AttendanceObjectsImplCopyWithImpl<$Res>
    extends _$AttendanceObjectsCopyWithImpl<$Res, _$AttendanceObjectsImpl>
    implements _$$AttendanceObjectsImplCopyWith<$Res> {
  __$$AttendanceObjectsImplCopyWithImpl(_$AttendanceObjectsImpl _value,
      $Res Function(_$AttendanceObjectsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$AttendanceObjectsImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AttendanceObjectsImpl implements _AttendanceObjects {
  _$AttendanceObjectsImpl(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'AttendanceObjects(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceObjectsImpl &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceObjectsImplCopyWith<_$AttendanceObjectsImpl> get copyWith =>
      __$$AttendanceObjectsImplCopyWithImpl<_$AttendanceObjectsImpl>(
          this, _$identity);
}

abstract class _AttendanceObjects implements AttendanceObjects {
  factory _AttendanceObjects(final String userID) = _$AttendanceObjectsImpl;

  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceObjectsImplCopyWith<_$AttendanceObjectsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmpBasicDataObject {
  String get userID => throw _privateConstructorUsedError;
  int get empId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmpBasicDataObjectCopyWith<EmpBasicDataObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpBasicDataObjectCopyWith<$Res> {
  factory $EmpBasicDataObjectCopyWith(
          EmpBasicDataObject value, $Res Function(EmpBasicDataObject) then) =
      _$EmpBasicDataObjectCopyWithImpl<$Res, EmpBasicDataObject>;
  @useResult
  $Res call({String userID, int empId});
}

/// @nodoc
class _$EmpBasicDataObjectCopyWithImpl<$Res, $Val extends EmpBasicDataObject>
    implements $EmpBasicDataObjectCopyWith<$Res> {
  _$EmpBasicDataObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? empId = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      empId: null == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmpBasicDataObjectImplCopyWith<$Res>
    implements $EmpBasicDataObjectCopyWith<$Res> {
  factory _$$EmpBasicDataObjectImplCopyWith(_$EmpBasicDataObjectImpl value,
          $Res Function(_$EmpBasicDataObjectImpl) then) =
      __$$EmpBasicDataObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID, int empId});
}

/// @nodoc
class __$$EmpBasicDataObjectImplCopyWithImpl<$Res>
    extends _$EmpBasicDataObjectCopyWithImpl<$Res, _$EmpBasicDataObjectImpl>
    implements _$$EmpBasicDataObjectImplCopyWith<$Res> {
  __$$EmpBasicDataObjectImplCopyWithImpl(_$EmpBasicDataObjectImpl _value,
      $Res Function(_$EmpBasicDataObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? empId = null,
  }) {
    return _then(_$EmpBasicDataObjectImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      null == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EmpBasicDataObjectImpl implements _EmpBasicDataObject {
  _$EmpBasicDataObjectImpl(this.userID, this.empId);

  @override
  final String userID;
  @override
  final int empId;

  @override
  String toString() {
    return 'EmpBasicDataObject(userID: $userID, empId: $empId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmpBasicDataObjectImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.empId, empId) || other.empId == empId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID, empId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmpBasicDataObjectImplCopyWith<_$EmpBasicDataObjectImpl> get copyWith =>
      __$$EmpBasicDataObjectImplCopyWithImpl<_$EmpBasicDataObjectImpl>(
          this, _$identity);
}

abstract class _EmpBasicDataObject implements EmpBasicDataObject {
  factory _EmpBasicDataObject(final String userID, final int empId) =
      _$EmpBasicDataObjectImpl;

  @override
  String get userID;
  @override
  int get empId;
  @override
  @JsonKey(ignore: true)
  _$$EmpBasicDataObjectImplCopyWith<_$EmpBasicDataObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmpBasicDataSaveObject {
  String get userID => throw _privateConstructorUsedError; //int empId,
  empBasicDataEmployeeObject get employee => throw _privateConstructorUsedError;
  empBasicDataAddressObject get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmpBasicDataSaveObjectCopyWith<EmpBasicDataSaveObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpBasicDataSaveObjectCopyWith<$Res> {
  factory $EmpBasicDataSaveObjectCopyWith(EmpBasicDataSaveObject value,
          $Res Function(EmpBasicDataSaveObject) then) =
      _$EmpBasicDataSaveObjectCopyWithImpl<$Res, EmpBasicDataSaveObject>;
  @useResult
  $Res call(
      {String userID,
      empBasicDataEmployeeObject employee,
      empBasicDataAddressObject address});

  $empBasicDataEmployeeObjectCopyWith<$Res> get employee;
  $empBasicDataAddressObjectCopyWith<$Res> get address;
}

/// @nodoc
class _$EmpBasicDataSaveObjectCopyWithImpl<$Res,
        $Val extends EmpBasicDataSaveObject>
    implements $EmpBasicDataSaveObjectCopyWith<$Res> {
  _$EmpBasicDataSaveObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? employee = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as empBasicDataEmployeeObject,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as empBasicDataAddressObject,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $empBasicDataEmployeeObjectCopyWith<$Res> get employee {
    return $empBasicDataEmployeeObjectCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $empBasicDataAddressObjectCopyWith<$Res> get address {
    return $empBasicDataAddressObjectCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmpBasicDataSaveObjectImplCopyWith<$Res>
    implements $EmpBasicDataSaveObjectCopyWith<$Res> {
  factory _$$EmpBasicDataSaveObjectImplCopyWith(
          _$EmpBasicDataSaveObjectImpl value,
          $Res Function(_$EmpBasicDataSaveObjectImpl) then) =
      __$$EmpBasicDataSaveObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userID,
      empBasicDataEmployeeObject employee,
      empBasicDataAddressObject address});

  @override
  $empBasicDataEmployeeObjectCopyWith<$Res> get employee;
  @override
  $empBasicDataAddressObjectCopyWith<$Res> get address;
}

/// @nodoc
class __$$EmpBasicDataSaveObjectImplCopyWithImpl<$Res>
    extends _$EmpBasicDataSaveObjectCopyWithImpl<$Res,
        _$EmpBasicDataSaveObjectImpl>
    implements _$$EmpBasicDataSaveObjectImplCopyWith<$Res> {
  __$$EmpBasicDataSaveObjectImplCopyWithImpl(
      _$EmpBasicDataSaveObjectImpl _value,
      $Res Function(_$EmpBasicDataSaveObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? employee = null,
    Object? address = null,
  }) {
    return _then(_$EmpBasicDataSaveObjectImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as empBasicDataEmployeeObject,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as empBasicDataAddressObject,
    ));
  }
}

/// @nodoc

class _$EmpBasicDataSaveObjectImpl implements _EmpBasicDataSaveObject {
  _$EmpBasicDataSaveObjectImpl(this.userID, this.employee, this.address);

  @override
  final String userID;
//int empId,
  @override
  final empBasicDataEmployeeObject employee;
  @override
  final empBasicDataAddressObject address;

  @override
  String toString() {
    return 'EmpBasicDataSaveObject(userID: $userID, employee: $employee, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmpBasicDataSaveObjectImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID, employee, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmpBasicDataSaveObjectImplCopyWith<_$EmpBasicDataSaveObjectImpl>
      get copyWith => __$$EmpBasicDataSaveObjectImplCopyWithImpl<
          _$EmpBasicDataSaveObjectImpl>(this, _$identity);
}

abstract class _EmpBasicDataSaveObject implements EmpBasicDataSaveObject {
  factory _EmpBasicDataSaveObject(
      final String userID,
      final empBasicDataEmployeeObject employee,
      final empBasicDataAddressObject address) = _$EmpBasicDataSaveObjectImpl;

  @override
  String get userID;
  @override //int empId,
  empBasicDataEmployeeObject get employee;
  @override
  empBasicDataAddressObject get address;
  @override
  @JsonKey(ignore: true)
  _$$EmpBasicDataSaveObjectImplCopyWith<_$EmpBasicDataSaveObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$empBasicDataEmployeeObject {
  int get empId => throw _privateConstructorUsedError;
  String get ArabicName => throw _privateConstructorUsedError;
  String get EnglishName => throw _privateConstructorUsedError;
  String get BirthDate => throw _privateConstructorUsedError;
  String get NationalId => throw _privateConstructorUsedError;
  String get SocialId => throw _privateConstructorUsedError;
  String get Email => throw _privateConstructorUsedError;
  String get Phone => throw _privateConstructorUsedError;
  String get Emergency_Number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $empBasicDataEmployeeObjectCopyWith<empBasicDataEmployeeObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $empBasicDataEmployeeObjectCopyWith<$Res> {
  factory $empBasicDataEmployeeObjectCopyWith(empBasicDataEmployeeObject value,
          $Res Function(empBasicDataEmployeeObject) then) =
      _$empBasicDataEmployeeObjectCopyWithImpl<$Res,
          empBasicDataEmployeeObject>;
  @useResult
  $Res call(
      {int empId,
      String ArabicName,
      String EnglishName,
      String BirthDate,
      String NationalId,
      String SocialId,
      String Email,
      String Phone,
      String Emergency_Number});
}

/// @nodoc
class _$empBasicDataEmployeeObjectCopyWithImpl<$Res,
        $Val extends empBasicDataEmployeeObject>
    implements $empBasicDataEmployeeObjectCopyWith<$Res> {
  _$empBasicDataEmployeeObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empId = null,
    Object? ArabicName = null,
    Object? EnglishName = null,
    Object? BirthDate = null,
    Object? NationalId = null,
    Object? SocialId = null,
    Object? Email = null,
    Object? Phone = null,
    Object? Emergency_Number = null,
  }) {
    return _then(_value.copyWith(
      empId: null == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as int,
      ArabicName: null == ArabicName
          ? _value.ArabicName
          : ArabicName // ignore: cast_nullable_to_non_nullable
              as String,
      EnglishName: null == EnglishName
          ? _value.EnglishName
          : EnglishName // ignore: cast_nullable_to_non_nullable
              as String,
      BirthDate: null == BirthDate
          ? _value.BirthDate
          : BirthDate // ignore: cast_nullable_to_non_nullable
              as String,
      NationalId: null == NationalId
          ? _value.NationalId
          : NationalId // ignore: cast_nullable_to_non_nullable
              as String,
      SocialId: null == SocialId
          ? _value.SocialId
          : SocialId // ignore: cast_nullable_to_non_nullable
              as String,
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Phone: null == Phone
          ? _value.Phone
          : Phone // ignore: cast_nullable_to_non_nullable
              as String,
      Emergency_Number: null == Emergency_Number
          ? _value.Emergency_Number
          : Emergency_Number // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$empBasicDataEmployeeObjectImplCopyWith<$Res>
    implements $empBasicDataEmployeeObjectCopyWith<$Res> {
  factory _$$empBasicDataEmployeeObjectImplCopyWith(
          _$empBasicDataEmployeeObjectImpl value,
          $Res Function(_$empBasicDataEmployeeObjectImpl) then) =
      __$$empBasicDataEmployeeObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int empId,
      String ArabicName,
      String EnglishName,
      String BirthDate,
      String NationalId,
      String SocialId,
      String Email,
      String Phone,
      String Emergency_Number});
}

/// @nodoc
class __$$empBasicDataEmployeeObjectImplCopyWithImpl<$Res>
    extends _$empBasicDataEmployeeObjectCopyWithImpl<$Res,
        _$empBasicDataEmployeeObjectImpl>
    implements _$$empBasicDataEmployeeObjectImplCopyWith<$Res> {
  __$$empBasicDataEmployeeObjectImplCopyWithImpl(
      _$empBasicDataEmployeeObjectImpl _value,
      $Res Function(_$empBasicDataEmployeeObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empId = null,
    Object? ArabicName = null,
    Object? EnglishName = null,
    Object? BirthDate = null,
    Object? NationalId = null,
    Object? SocialId = null,
    Object? Email = null,
    Object? Phone = null,
    Object? Emergency_Number = null,
  }) {
    return _then(_$empBasicDataEmployeeObjectImpl(
      null == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as int,
      null == ArabicName
          ? _value.ArabicName
          : ArabicName // ignore: cast_nullable_to_non_nullable
              as String,
      null == EnglishName
          ? _value.EnglishName
          : EnglishName // ignore: cast_nullable_to_non_nullable
              as String,
      null == BirthDate
          ? _value.BirthDate
          : BirthDate // ignore: cast_nullable_to_non_nullable
              as String,
      null == NationalId
          ? _value.NationalId
          : NationalId // ignore: cast_nullable_to_non_nullable
              as String,
      null == SocialId
          ? _value.SocialId
          : SocialId // ignore: cast_nullable_to_non_nullable
              as String,
      null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      null == Phone
          ? _value.Phone
          : Phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == Emergency_Number
          ? _value.Emergency_Number
          : Emergency_Number // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$empBasicDataEmployeeObjectImpl implements _empBasicDataEmployeeObject {
  _$empBasicDataEmployeeObjectImpl(
      this.empId,
      this.ArabicName,
      this.EnglishName,
      this.BirthDate,
      this.NationalId,
      this.SocialId,
      this.Email,
      this.Phone,
      this.Emergency_Number);

  @override
  final int empId;
  @override
  final String ArabicName;
  @override
  final String EnglishName;
  @override
  final String BirthDate;
  @override
  final String NationalId;
  @override
  final String SocialId;
  @override
  final String Email;
  @override
  final String Phone;
  @override
  final String Emergency_Number;

  @override
  String toString() {
    return 'empBasicDataEmployeeObject(empId: $empId, ArabicName: $ArabicName, EnglishName: $EnglishName, BirthDate: $BirthDate, NationalId: $NationalId, SocialId: $SocialId, Email: $Email, Phone: $Phone, Emergency_Number: $Emergency_Number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$empBasicDataEmployeeObjectImpl &&
            (identical(other.empId, empId) || other.empId == empId) &&
            (identical(other.ArabicName, ArabicName) ||
                other.ArabicName == ArabicName) &&
            (identical(other.EnglishName, EnglishName) ||
                other.EnglishName == EnglishName) &&
            (identical(other.BirthDate, BirthDate) ||
                other.BirthDate == BirthDate) &&
            (identical(other.NationalId, NationalId) ||
                other.NationalId == NationalId) &&
            (identical(other.SocialId, SocialId) ||
                other.SocialId == SocialId) &&
            (identical(other.Email, Email) || other.Email == Email) &&
            (identical(other.Phone, Phone) || other.Phone == Phone) &&
            (identical(other.Emergency_Number, Emergency_Number) ||
                other.Emergency_Number == Emergency_Number));
  }

  @override
  int get hashCode => Object.hash(runtimeType, empId, ArabicName, EnglishName,
      BirthDate, NationalId, SocialId, Email, Phone, Emergency_Number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$empBasicDataEmployeeObjectImplCopyWith<_$empBasicDataEmployeeObjectImpl>
      get copyWith => __$$empBasicDataEmployeeObjectImplCopyWithImpl<
          _$empBasicDataEmployeeObjectImpl>(this, _$identity);
}

abstract class _empBasicDataEmployeeObject
    implements empBasicDataEmployeeObject {
  factory _empBasicDataEmployeeObject(
      final int empId,
      final String ArabicName,
      final String EnglishName,
      final String BirthDate,
      final String NationalId,
      final String SocialId,
      final String Email,
      final String Phone,
      final String Emergency_Number) = _$empBasicDataEmployeeObjectImpl;

  @override
  int get empId;
  @override
  String get ArabicName;
  @override
  String get EnglishName;
  @override
  String get BirthDate;
  @override
  String get NationalId;
  @override
  String get SocialId;
  @override
  String get Email;
  @override
  String get Phone;
  @override
  String get Emergency_Number;
  @override
  @JsonKey(ignore: true)
  _$$empBasicDataEmployeeObjectImplCopyWith<_$empBasicDataEmployeeObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$empBasicDataAddressObject {
  String get AddressText => throw _privateConstructorUsedError;
  int get DistrictId => throw _privateConstructorUsedError;
  String get PoBox => throw _privateConstructorUsedError;
  String get ZipCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $empBasicDataAddressObjectCopyWith<empBasicDataAddressObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $empBasicDataAddressObjectCopyWith<$Res> {
  factory $empBasicDataAddressObjectCopyWith(empBasicDataAddressObject value,
          $Res Function(empBasicDataAddressObject) then) =
      _$empBasicDataAddressObjectCopyWithImpl<$Res, empBasicDataAddressObject>;
  @useResult
  $Res call({String AddressText, int DistrictId, String PoBox, String ZipCode});
}

/// @nodoc
class _$empBasicDataAddressObjectCopyWithImpl<$Res,
        $Val extends empBasicDataAddressObject>
    implements $empBasicDataAddressObjectCopyWith<$Res> {
  _$empBasicDataAddressObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? AddressText = null,
    Object? DistrictId = null,
    Object? PoBox = null,
    Object? ZipCode = null,
  }) {
    return _then(_value.copyWith(
      AddressText: null == AddressText
          ? _value.AddressText
          : AddressText // ignore: cast_nullable_to_non_nullable
              as String,
      DistrictId: null == DistrictId
          ? _value.DistrictId
          : DistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      PoBox: null == PoBox
          ? _value.PoBox
          : PoBox // ignore: cast_nullable_to_non_nullable
              as String,
      ZipCode: null == ZipCode
          ? _value.ZipCode
          : ZipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$empBasicDataAddressObjectImplCopyWith<$Res>
    implements $empBasicDataAddressObjectCopyWith<$Res> {
  factory _$$empBasicDataAddressObjectImplCopyWith(
          _$empBasicDataAddressObjectImpl value,
          $Res Function(_$empBasicDataAddressObjectImpl) then) =
      __$$empBasicDataAddressObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String AddressText, int DistrictId, String PoBox, String ZipCode});
}

/// @nodoc
class __$$empBasicDataAddressObjectImplCopyWithImpl<$Res>
    extends _$empBasicDataAddressObjectCopyWithImpl<$Res,
        _$empBasicDataAddressObjectImpl>
    implements _$$empBasicDataAddressObjectImplCopyWith<$Res> {
  __$$empBasicDataAddressObjectImplCopyWithImpl(
      _$empBasicDataAddressObjectImpl _value,
      $Res Function(_$empBasicDataAddressObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? AddressText = null,
    Object? DistrictId = null,
    Object? PoBox = null,
    Object? ZipCode = null,
  }) {
    return _then(_$empBasicDataAddressObjectImpl(
      null == AddressText
          ? _value.AddressText
          : AddressText // ignore: cast_nullable_to_non_nullable
              as String,
      null == DistrictId
          ? _value.DistrictId
          : DistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      null == PoBox
          ? _value.PoBox
          : PoBox // ignore: cast_nullable_to_non_nullable
              as String,
      null == ZipCode
          ? _value.ZipCode
          : ZipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$empBasicDataAddressObjectImpl implements _empBasicDataAddressObject {
  _$empBasicDataAddressObjectImpl(
      this.AddressText, this.DistrictId, this.PoBox, this.ZipCode);

  @override
  final String AddressText;
  @override
  final int DistrictId;
  @override
  final String PoBox;
  @override
  final String ZipCode;

  @override
  String toString() {
    return 'empBasicDataAddressObject(AddressText: $AddressText, DistrictId: $DistrictId, PoBox: $PoBox, ZipCode: $ZipCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$empBasicDataAddressObjectImpl &&
            (identical(other.AddressText, AddressText) ||
                other.AddressText == AddressText) &&
            (identical(other.DistrictId, DistrictId) ||
                other.DistrictId == DistrictId) &&
            (identical(other.PoBox, PoBox) || other.PoBox == PoBox) &&
            (identical(other.ZipCode, ZipCode) || other.ZipCode == ZipCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, AddressText, DistrictId, PoBox, ZipCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$empBasicDataAddressObjectImplCopyWith<_$empBasicDataAddressObjectImpl>
      get copyWith => __$$empBasicDataAddressObjectImplCopyWithImpl<
          _$empBasicDataAddressObjectImpl>(this, _$identity);
}

abstract class _empBasicDataAddressObject implements empBasicDataAddressObject {
  factory _empBasicDataAddressObject(
      final String AddressText,
      final int DistrictId,
      final String PoBox,
      final String ZipCode) = _$empBasicDataAddressObjectImpl;

  @override
  String get AddressText;
  @override
  int get DistrictId;
  @override
  String get PoBox;
  @override
  String get ZipCode;
  @override
  @JsonKey(ignore: true)
  _$$empBasicDataAddressObjectImplCopyWith<_$empBasicDataAddressObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$empSkillsObject {
  String get userID => throw _privateConstructorUsedError;
  String get Date => throw _privateConstructorUsedError;
  int get GradeId => throw _privateConstructorUsedError;
  int get QualificationId => throw _privateConstructorUsedError;
  int get EmployeeId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $empSkillsObjectCopyWith<empSkillsObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $empSkillsObjectCopyWith<$Res> {
  factory $empSkillsObjectCopyWith(
          empSkillsObject value, $Res Function(empSkillsObject) then) =
      _$empSkillsObjectCopyWithImpl<$Res, empSkillsObject>;
  @useResult
  $Res call(
      {String userID,
      String Date,
      int GradeId,
      int QualificationId,
      int EmployeeId});
}

/// @nodoc
class _$empSkillsObjectCopyWithImpl<$Res, $Val extends empSkillsObject>
    implements $empSkillsObjectCopyWith<$Res> {
  _$empSkillsObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? Date = null,
    Object? GradeId = null,
    Object? QualificationId = null,
    Object? EmployeeId = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      Date: null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as String,
      GradeId: null == GradeId
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      QualificationId: null == QualificationId
          ? _value.QualificationId
          : QualificationId // ignore: cast_nullable_to_non_nullable
              as int,
      EmployeeId: null == EmployeeId
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$empSkillsObjectImplCopyWith<$Res>
    implements $empSkillsObjectCopyWith<$Res> {
  factory _$$empSkillsObjectImplCopyWith(_$empSkillsObjectImpl value,
          $Res Function(_$empSkillsObjectImpl) then) =
      __$$empSkillsObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userID,
      String Date,
      int GradeId,
      int QualificationId,
      int EmployeeId});
}

/// @nodoc
class __$$empSkillsObjectImplCopyWithImpl<$Res>
    extends _$empSkillsObjectCopyWithImpl<$Res, _$empSkillsObjectImpl>
    implements _$$empSkillsObjectImplCopyWith<$Res> {
  __$$empSkillsObjectImplCopyWithImpl(
      _$empSkillsObjectImpl _value, $Res Function(_$empSkillsObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? Date = null,
    Object? GradeId = null,
    Object? QualificationId = null,
    Object? EmployeeId = null,
  }) {
    return _then(_$empSkillsObjectImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as String,
      null == GradeId
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      null == QualificationId
          ? _value.QualificationId
          : QualificationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == EmployeeId
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$empSkillsObjectImpl implements _empSkillsObject {
  _$empSkillsObjectImpl(this.userID, this.Date, this.GradeId,
      this.QualificationId, this.EmployeeId);

  @override
  final String userID;
  @override
  final String Date;
  @override
  final int GradeId;
  @override
  final int QualificationId;
  @override
  final int EmployeeId;

  @override
  String toString() {
    return 'empSkillsObject(userID: $userID, Date: $Date, GradeId: $GradeId, QualificationId: $QualificationId, EmployeeId: $EmployeeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$empSkillsObjectImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.Date, Date) || other.Date == Date) &&
            (identical(other.GradeId, GradeId) || other.GradeId == GradeId) &&
            (identical(other.QualificationId, QualificationId) ||
                other.QualificationId == QualificationId) &&
            (identical(other.EmployeeId, EmployeeId) ||
                other.EmployeeId == EmployeeId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userID, Date, GradeId, QualificationId, EmployeeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$empSkillsObjectImplCopyWith<_$empSkillsObjectImpl> get copyWith =>
      __$$empSkillsObjectImplCopyWithImpl<_$empSkillsObjectImpl>(
          this, _$identity);
}

abstract class _empSkillsObject implements empSkillsObject {
  factory _empSkillsObject(
      final String userID,
      final String Date,
      final int GradeId,
      final int QualificationId,
      final int EmployeeId) = _$empSkillsObjectImpl;

  @override
  String get userID;
  @override
  String get Date;
  @override
  int get GradeId;
  @override
  int get QualificationId;
  @override
  int get EmployeeId;
  @override
  @JsonKey(ignore: true)
  _$$empSkillsObjectImplCopyWith<_$empSkillsObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$empAcademicDegreeObject {
  String get userID => throw _privateConstructorUsedError;
  int get Id => throw _privateConstructorUsedError;
  String get Major => throw _privateConstructorUsedError;
  String get University => throw _privateConstructorUsedError;
  String get Notes => throw _privateConstructorUsedError;
  int get EmployeeId => throw _privateConstructorUsedError;
  int get AcademicDegreeTypeId => throw _privateConstructorUsedError;
  int get GradeId => throw _privateConstructorUsedError;
  String get DegreeDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $empAcademicDegreeObjectCopyWith<empAcademicDegreeObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $empAcademicDegreeObjectCopyWith<$Res> {
  factory $empAcademicDegreeObjectCopyWith(empAcademicDegreeObject value,
          $Res Function(empAcademicDegreeObject) then) =
      _$empAcademicDegreeObjectCopyWithImpl<$Res, empAcademicDegreeObject>;
  @useResult
  $Res call(
      {String userID,
      int Id,
      String Major,
      String University,
      String Notes,
      int EmployeeId,
      int AcademicDegreeTypeId,
      int GradeId,
      String DegreeDate});
}

/// @nodoc
class _$empAcademicDegreeObjectCopyWithImpl<$Res,
        $Val extends empAcademicDegreeObject>
    implements $empAcademicDegreeObjectCopyWith<$Res> {
  _$empAcademicDegreeObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? Id = null,
    Object? Major = null,
    Object? University = null,
    Object? Notes = null,
    Object? EmployeeId = null,
    Object? AcademicDegreeTypeId = null,
    Object? GradeId = null,
    Object? DegreeDate = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      Id: null == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as int,
      Major: null == Major
          ? _value.Major
          : Major // ignore: cast_nullable_to_non_nullable
              as String,
      University: null == University
          ? _value.University
          : University // ignore: cast_nullable_to_non_nullable
              as String,
      Notes: null == Notes
          ? _value.Notes
          : Notes // ignore: cast_nullable_to_non_nullable
              as String,
      EmployeeId: null == EmployeeId
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
      AcademicDegreeTypeId: null == AcademicDegreeTypeId
          ? _value.AcademicDegreeTypeId
          : AcademicDegreeTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      GradeId: null == GradeId
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      DegreeDate: null == DegreeDate
          ? _value.DegreeDate
          : DegreeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$empAcademicDegreeObjectImplCopyWith<$Res>
    implements $empAcademicDegreeObjectCopyWith<$Res> {
  factory _$$empAcademicDegreeObjectImplCopyWith(
          _$empAcademicDegreeObjectImpl value,
          $Res Function(_$empAcademicDegreeObjectImpl) then) =
      __$$empAcademicDegreeObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userID,
      int Id,
      String Major,
      String University,
      String Notes,
      int EmployeeId,
      int AcademicDegreeTypeId,
      int GradeId,
      String DegreeDate});
}

/// @nodoc
class __$$empAcademicDegreeObjectImplCopyWithImpl<$Res>
    extends _$empAcademicDegreeObjectCopyWithImpl<$Res,
        _$empAcademicDegreeObjectImpl>
    implements _$$empAcademicDegreeObjectImplCopyWith<$Res> {
  __$$empAcademicDegreeObjectImplCopyWithImpl(
      _$empAcademicDegreeObjectImpl _value,
      $Res Function(_$empAcademicDegreeObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? Id = null,
    Object? Major = null,
    Object? University = null,
    Object? Notes = null,
    Object? EmployeeId = null,
    Object? AcademicDegreeTypeId = null,
    Object? GradeId = null,
    Object? DegreeDate = null,
  }) {
    return _then(_$empAcademicDegreeObjectImpl(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      null == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as int,
      null == Major
          ? _value.Major
          : Major // ignore: cast_nullable_to_non_nullable
              as String,
      null == University
          ? _value.University
          : University // ignore: cast_nullable_to_non_nullable
              as String,
      null == Notes
          ? _value.Notes
          : Notes // ignore: cast_nullable_to_non_nullable
              as String,
      null == EmployeeId
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
      null == AcademicDegreeTypeId
          ? _value.AcademicDegreeTypeId
          : AcademicDegreeTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      null == GradeId
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      null == DegreeDate
          ? _value.DegreeDate
          : DegreeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$empAcademicDegreeObjectImpl implements _empAcademicDegreeObject {
  _$empAcademicDegreeObjectImpl(
      this.userID,
      this.Id,
      this.Major,
      this.University,
      this.Notes,
      this.EmployeeId,
      this.AcademicDegreeTypeId,
      this.GradeId,
      this.DegreeDate);

  @override
  final String userID;
  @override
  final int Id;
  @override
  final String Major;
  @override
  final String University;
  @override
  final String Notes;
  @override
  final int EmployeeId;
  @override
  final int AcademicDegreeTypeId;
  @override
  final int GradeId;
  @override
  final String DegreeDate;

  @override
  String toString() {
    return 'empAcademicDegreeObject(userID: $userID, Id: $Id, Major: $Major, University: $University, Notes: $Notes, EmployeeId: $EmployeeId, AcademicDegreeTypeId: $AcademicDegreeTypeId, GradeId: $GradeId, DegreeDate: $DegreeDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$empAcademicDegreeObjectImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.Id, Id) || other.Id == Id) &&
            (identical(other.Major, Major) || other.Major == Major) &&
            (identical(other.University, University) ||
                other.University == University) &&
            (identical(other.Notes, Notes) || other.Notes == Notes) &&
            (identical(other.EmployeeId, EmployeeId) ||
                other.EmployeeId == EmployeeId) &&
            (identical(other.AcademicDegreeTypeId, AcademicDegreeTypeId) ||
                other.AcademicDegreeTypeId == AcademicDegreeTypeId) &&
            (identical(other.GradeId, GradeId) || other.GradeId == GradeId) &&
            (identical(other.DegreeDate, DegreeDate) ||
                other.DegreeDate == DegreeDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID, Id, Major, University,
      Notes, EmployeeId, AcademicDegreeTypeId, GradeId, DegreeDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$empAcademicDegreeObjectImplCopyWith<_$empAcademicDegreeObjectImpl>
      get copyWith => __$$empAcademicDegreeObjectImplCopyWithImpl<
          _$empAcademicDegreeObjectImpl>(this, _$identity);
}

abstract class _empAcademicDegreeObject implements empAcademicDegreeObject {
  factory _empAcademicDegreeObject(
      final String userID,
      final int Id,
      final String Major,
      final String University,
      final String Notes,
      final int EmployeeId,
      final int AcademicDegreeTypeId,
      final int GradeId,
      final String DegreeDate) = _$empAcademicDegreeObjectImpl;

  @override
  String get userID;
  @override
  int get Id;
  @override
  String get Major;
  @override
  String get University;
  @override
  String get Notes;
  @override
  int get EmployeeId;
  @override
  int get AcademicDegreeTypeId;
  @override
  int get GradeId;
  @override
  String get DegreeDate;
  @override
  @JsonKey(ignore: true)
  _$$empAcademicDegreeObjectImplCopyWith<_$empAcademicDegreeObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}
