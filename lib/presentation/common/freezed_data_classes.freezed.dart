// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginObjectTearOff {
  const _$LoginObjectTearOff();

  _LoginObject call(String email, String password, String deviceId) {
    return _LoginObject(
      email,
      password,
      deviceId,
    );
  }
}

/// @nodoc
const $LoginObject = _$LoginObjectTearOff();

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
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String email, String password, String deviceId});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$LoginObjectCopyWith(
          _LoginObject value, $Res Function(_LoginObject) then) =
      __$LoginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password, String deviceId});
}

/// @nodoc
class __$LoginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$LoginObjectCopyWith<$Res> {
  __$LoginObjectCopyWithImpl(
      _LoginObject _value, $Res Function(_LoginObject) _then)
      : super(_value, (v) => _then(v as _LoginObject));

  @override
  _LoginObject get _value => super._value as _LoginObject;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_LoginObject(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.email, this.password, this.deviceId);

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
        (other is _LoginObject &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(deviceId);

  @JsonKey(ignore: true)
  @override
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      __$LoginObjectCopyWithImpl<_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(String email, String password, String deviceId) =
      _$_LoginObject;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get deviceId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UserObjectTearOff {
  const _$UserObjectTearOff();

  _UserObject call(String userID) {
    return _UserObject(
      userID,
    );
  }
}

/// @nodoc
const $UserObject = _$UserObjectTearOff();

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
      _$UserObjectCopyWithImpl<$Res>;
  $Res call({String userID});
}

/// @nodoc
class _$UserObjectCopyWithImpl<$Res> implements $UserObjectCopyWith<$Res> {
  _$UserObjectCopyWithImpl(this._value, this._then);

  final UserObject _value;
  // ignore: unused_field
  final $Res Function(UserObject) _then;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserObjectCopyWith<$Res> implements $UserObjectCopyWith<$Res> {
  factory _$UserObjectCopyWith(
          _UserObject value, $Res Function(_UserObject) then) =
      __$UserObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userID});
}

/// @nodoc
class __$UserObjectCopyWithImpl<$Res> extends _$UserObjectCopyWithImpl<$Res>
    implements _$UserObjectCopyWith<$Res> {
  __$UserObjectCopyWithImpl(
      _UserObject _value, $Res Function(_UserObject) _then)
      : super(_value, (v) => _then(v as _UserObject));

  @override
  _UserObject get _value => super._value as _UserObject;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_UserObject(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserObject implements _UserObject {
  _$_UserObject(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'UserObject(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserObject &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userID);

  @JsonKey(ignore: true)
  @override
  _$UserObjectCopyWith<_UserObject> get copyWith =>
      __$UserObjectCopyWithImpl<_UserObject>(this, _$identity);
}

abstract class _UserObject implements UserObject {
  factory _UserObject(String userID) = _$_UserObject;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserObjectCopyWith<_UserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$gradeObjectTearOff {
  const _$gradeObjectTearOff();

  _gradeObject call(String userID) {
    return _gradeObject(
      userID,
    );
  }
}

/// @nodoc
const $gradeObject = _$gradeObjectTearOff();

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
      _$gradeObjectCopyWithImpl<$Res>;
  $Res call({String userID});
}

/// @nodoc
class _$gradeObjectCopyWithImpl<$Res> implements $gradeObjectCopyWith<$Res> {
  _$gradeObjectCopyWithImpl(this._value, this._then);

  final gradeObject _value;
  // ignore: unused_field
  final $Res Function(gradeObject) _then;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$gradeObjectCopyWith<$Res>
    implements $gradeObjectCopyWith<$Res> {
  factory _$gradeObjectCopyWith(
          _gradeObject value, $Res Function(_gradeObject) then) =
      __$gradeObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userID});
}

/// @nodoc
class __$gradeObjectCopyWithImpl<$Res> extends _$gradeObjectCopyWithImpl<$Res>
    implements _$gradeObjectCopyWith<$Res> {
  __$gradeObjectCopyWithImpl(
      _gradeObject _value, $Res Function(_gradeObject) _then)
      : super(_value, (v) => _then(v as _gradeObject));

  @override
  _gradeObject get _value => super._value as _gradeObject;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_gradeObject(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_gradeObject implements _gradeObject {
  _$_gradeObject(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'gradeObject(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _gradeObject &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userID);

  @JsonKey(ignore: true)
  @override
  _$gradeObjectCopyWith<_gradeObject> get copyWith =>
      __$gradeObjectCopyWithImpl<_gradeObject>(this, _$identity);
}

abstract class _gradeObject implements gradeObject {
  factory _gradeObject(String userID) = _$_gradeObject;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$gradeObjectCopyWith<_gradeObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$VacationsObjectsTearOff {
  const _$VacationsObjectsTearOff();

  _VacationObjects call(String userID) {
    return _VacationObjects(
      userID,
    );
  }
}

/// @nodoc
const $VacationsObjects = _$VacationsObjectsTearOff();

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
      _$VacationsObjectsCopyWithImpl<$Res>;
  $Res call({String userID});
}

/// @nodoc
class _$VacationsObjectsCopyWithImpl<$Res>
    implements $VacationsObjectsCopyWith<$Res> {
  _$VacationsObjectsCopyWithImpl(this._value, this._then);

  final VacationsObjects _value;
  // ignore: unused_field
  final $Res Function(VacationsObjects) _then;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VacationObjectsCopyWith<$Res>
    implements $VacationsObjectsCopyWith<$Res> {
  factory _$VacationObjectsCopyWith(
          _VacationObjects value, $Res Function(_VacationObjects) then) =
      __$VacationObjectsCopyWithImpl<$Res>;
  @override
  $Res call({String userID});
}

/// @nodoc
class __$VacationObjectsCopyWithImpl<$Res>
    extends _$VacationsObjectsCopyWithImpl<$Res>
    implements _$VacationObjectsCopyWith<$Res> {
  __$VacationObjectsCopyWithImpl(
      _VacationObjects _value, $Res Function(_VacationObjects) _then)
      : super(_value, (v) => _then(v as _VacationObjects));

  @override
  _VacationObjects get _value => super._value as _VacationObjects;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_VacationObjects(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VacationObjects implements _VacationObjects {
  _$_VacationObjects(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'VacationsObjects(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VacationObjects &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userID);

  @JsonKey(ignore: true)
  @override
  _$VacationObjectsCopyWith<_VacationObjects> get copyWith =>
      __$VacationObjectsCopyWithImpl<_VacationObjects>(this, _$identity);
}

abstract class _VacationObjects implements VacationsObjects {
  factory _VacationObjects(String userID) = _$_VacationObjects;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VacationObjectsCopyWith<_VacationObjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SalaryObjectsTearOff {
  const _$SalaryObjectsTearOff();

  _SalaryObjects call(String userID) {
    return _SalaryObjects(
      userID,
    );
  }
}

/// @nodoc
const $SalaryObjects = _$SalaryObjectsTearOff();

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
      _$SalaryObjectsCopyWithImpl<$Res>;
  $Res call({String userID});
}

/// @nodoc
class _$SalaryObjectsCopyWithImpl<$Res>
    implements $SalaryObjectsCopyWith<$Res> {
  _$SalaryObjectsCopyWithImpl(this._value, this._then);

  final SalaryObjects _value;
  // ignore: unused_field
  final $Res Function(SalaryObjects) _then;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SalaryObjectsCopyWith<$Res>
    implements $SalaryObjectsCopyWith<$Res> {
  factory _$SalaryObjectsCopyWith(
          _SalaryObjects value, $Res Function(_SalaryObjects) then) =
      __$SalaryObjectsCopyWithImpl<$Res>;
  @override
  $Res call({String userID});
}

/// @nodoc
class __$SalaryObjectsCopyWithImpl<$Res>
    extends _$SalaryObjectsCopyWithImpl<$Res>
    implements _$SalaryObjectsCopyWith<$Res> {
  __$SalaryObjectsCopyWithImpl(
      _SalaryObjects _value, $Res Function(_SalaryObjects) _then)
      : super(_value, (v) => _then(v as _SalaryObjects));

  @override
  _SalaryObjects get _value => super._value as _SalaryObjects;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_SalaryObjects(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SalaryObjects implements _SalaryObjects {
  _$_SalaryObjects(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'SalaryObjects(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SalaryObjects &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userID);

  @JsonKey(ignore: true)
  @override
  _$SalaryObjectsCopyWith<_SalaryObjects> get copyWith =>
      __$SalaryObjectsCopyWithImpl<_SalaryObjects>(this, _$identity);
}

abstract class _SalaryObjects implements SalaryObjects {
  factory _SalaryObjects(String userID) = _$_SalaryObjects;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SalaryObjectsCopyWith<_SalaryObjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SalaryDetailsObjectsTearOff {
  const _$SalaryDetailsObjectsTearOff();

  _SalaryDetailsObjects call(String userID) {
    return _SalaryDetailsObjects(
      userID,
    );
  }
}

/// @nodoc
const $SalaryDetailsObjects = _$SalaryDetailsObjectsTearOff();

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
      _$SalaryDetailsObjectsCopyWithImpl<$Res>;
  $Res call({String userID});
}

/// @nodoc
class _$SalaryDetailsObjectsCopyWithImpl<$Res>
    implements $SalaryDetailsObjectsCopyWith<$Res> {
  _$SalaryDetailsObjectsCopyWithImpl(this._value, this._then);

  final SalaryDetailsObjects _value;
  // ignore: unused_field
  final $Res Function(SalaryDetailsObjects) _then;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SalaryDetailsObjectsCopyWith<$Res>
    implements $SalaryDetailsObjectsCopyWith<$Res> {
  factory _$SalaryDetailsObjectsCopyWith(_SalaryDetailsObjects value,
          $Res Function(_SalaryDetailsObjects) then) =
      __$SalaryDetailsObjectsCopyWithImpl<$Res>;
  @override
  $Res call({String userID});
}

/// @nodoc
class __$SalaryDetailsObjectsCopyWithImpl<$Res>
    extends _$SalaryDetailsObjectsCopyWithImpl<$Res>
    implements _$SalaryDetailsObjectsCopyWith<$Res> {
  __$SalaryDetailsObjectsCopyWithImpl(
      _SalaryDetailsObjects _value, $Res Function(_SalaryDetailsObjects) _then)
      : super(_value, (v) => _then(v as _SalaryDetailsObjects));

  @override
  _SalaryDetailsObjects get _value => super._value as _SalaryDetailsObjects;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_SalaryDetailsObjects(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SalaryDetailsObjects implements _SalaryDetailsObjects {
  _$_SalaryDetailsObjects(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'SalaryDetailsObjects(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SalaryDetailsObjects &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userID);

  @JsonKey(ignore: true)
  @override
  _$SalaryDetailsObjectsCopyWith<_SalaryDetailsObjects> get copyWith =>
      __$SalaryDetailsObjectsCopyWithImpl<_SalaryDetailsObjects>(
          this, _$identity);
}

abstract class _SalaryDetailsObjects implements SalaryDetailsObjects {
  factory _SalaryDetailsObjects(String userID) = _$_SalaryDetailsObjects;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SalaryDetailsObjectsCopyWith<_SalaryDetailsObjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$EmpBasicDataObjectTearOff {
  const _$EmpBasicDataObjectTearOff();

  _EmpBasicDataObject call(String userID, int empId) {
    return _EmpBasicDataObject(
      userID,
      empId,
    );
  }
}

/// @nodoc
const $EmpBasicDataObject = _$EmpBasicDataObjectTearOff();

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
      _$EmpBasicDataObjectCopyWithImpl<$Res>;
  $Res call({String userID, int empId});
}

/// @nodoc
class _$EmpBasicDataObjectCopyWithImpl<$Res>
    implements $EmpBasicDataObjectCopyWith<$Res> {
  _$EmpBasicDataObjectCopyWithImpl(this._value, this._then);

  final EmpBasicDataObject _value;
  // ignore: unused_field
  final $Res Function(EmpBasicDataObject) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? empId = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      empId: empId == freezed
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$EmpBasicDataObjectCopyWith<$Res>
    implements $EmpBasicDataObjectCopyWith<$Res> {
  factory _$EmpBasicDataObjectCopyWith(
          _EmpBasicDataObject value, $Res Function(_EmpBasicDataObject) then) =
      __$EmpBasicDataObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userID, int empId});
}

/// @nodoc
class __$EmpBasicDataObjectCopyWithImpl<$Res>
    extends _$EmpBasicDataObjectCopyWithImpl<$Res>
    implements _$EmpBasicDataObjectCopyWith<$Res> {
  __$EmpBasicDataObjectCopyWithImpl(
      _EmpBasicDataObject _value, $Res Function(_EmpBasicDataObject) _then)
      : super(_value, (v) => _then(v as _EmpBasicDataObject));

  @override
  _EmpBasicDataObject get _value => super._value as _EmpBasicDataObject;

  @override
  $Res call({
    Object? userID = freezed,
    Object? empId = freezed,
  }) {
    return _then(_EmpBasicDataObject(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      empId == freezed
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_EmpBasicDataObject implements _EmpBasicDataObject {
  _$_EmpBasicDataObject(this.userID, this.empId);

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
        (other is _EmpBasicDataObject &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.empId, empId) ||
                const DeepCollectionEquality().equals(other.empId, empId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(empId);

  @JsonKey(ignore: true)
  @override
  _$EmpBasicDataObjectCopyWith<_EmpBasicDataObject> get copyWith =>
      __$EmpBasicDataObjectCopyWithImpl<_EmpBasicDataObject>(this, _$identity);
}

abstract class _EmpBasicDataObject implements EmpBasicDataObject {
  factory _EmpBasicDataObject(String userID, int empId) = _$_EmpBasicDataObject;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  int get empId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EmpBasicDataObjectCopyWith<_EmpBasicDataObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$empSkillsObjectTearOff {
  const _$empSkillsObjectTearOff();

  _empSkillsObject call(String userID, String Date, int GradeId,
      int QualificationId, int EmployeeId) {
    return _empSkillsObject(
      userID,
      Date,
      GradeId,
      QualificationId,
      EmployeeId,
    );
  }
}

/// @nodoc
const $empSkillsObject = _$empSkillsObjectTearOff();

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
      _$empSkillsObjectCopyWithImpl<$Res>;
  $Res call(
      {String userID,
      String Date,
      int GradeId,
      int QualificationId,
      int EmployeeId});
}

/// @nodoc
class _$empSkillsObjectCopyWithImpl<$Res>
    implements $empSkillsObjectCopyWith<$Res> {
  _$empSkillsObjectCopyWithImpl(this._value, this._then);

  final empSkillsObject _value;
  // ignore: unused_field
  final $Res Function(empSkillsObject) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? Date = freezed,
    Object? GradeId = freezed,
    Object? QualificationId = freezed,
    Object? EmployeeId = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      Date: Date == freezed
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as String,
      GradeId: GradeId == freezed
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      QualificationId: QualificationId == freezed
          ? _value.QualificationId
          : QualificationId // ignore: cast_nullable_to_non_nullable
              as int,
      EmployeeId: EmployeeId == freezed
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$empSkillsObjectCopyWith<$Res>
    implements $empSkillsObjectCopyWith<$Res> {
  factory _$empSkillsObjectCopyWith(
          _empSkillsObject value, $Res Function(_empSkillsObject) then) =
      __$empSkillsObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userID,
      String Date,
      int GradeId,
      int QualificationId,
      int EmployeeId});
}

/// @nodoc
class __$empSkillsObjectCopyWithImpl<$Res>
    extends _$empSkillsObjectCopyWithImpl<$Res>
    implements _$empSkillsObjectCopyWith<$Res> {
  __$empSkillsObjectCopyWithImpl(
      _empSkillsObject _value, $Res Function(_empSkillsObject) _then)
      : super(_value, (v) => _then(v as _empSkillsObject));

  @override
  _empSkillsObject get _value => super._value as _empSkillsObject;

  @override
  $Res call({
    Object? userID = freezed,
    Object? Date = freezed,
    Object? GradeId = freezed,
    Object? QualificationId = freezed,
    Object? EmployeeId = freezed,
  }) {
    return _then(_empSkillsObject(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      Date == freezed
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as String,
      GradeId == freezed
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      QualificationId == freezed
          ? _value.QualificationId
          : QualificationId // ignore: cast_nullable_to_non_nullable
              as int,
      EmployeeId == freezed
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_empSkillsObject implements _empSkillsObject {
  _$_empSkillsObject(this.userID, this.Date, this.GradeId, this.QualificationId,
      this.EmployeeId);

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
        (other is _empSkillsObject &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.Date, Date) ||
                const DeepCollectionEquality().equals(other.Date, Date)) &&
            (identical(other.GradeId, GradeId) ||
                const DeepCollectionEquality()
                    .equals(other.GradeId, GradeId)) &&
            (identical(other.QualificationId, QualificationId) ||
                const DeepCollectionEquality()
                    .equals(other.QualificationId, QualificationId)) &&
            (identical(other.EmployeeId, EmployeeId) ||
                const DeepCollectionEquality()
                    .equals(other.EmployeeId, EmployeeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(Date) ^
      const DeepCollectionEquality().hash(GradeId) ^
      const DeepCollectionEquality().hash(QualificationId) ^
      const DeepCollectionEquality().hash(EmployeeId);

  @JsonKey(ignore: true)
  @override
  _$empSkillsObjectCopyWith<_empSkillsObject> get copyWith =>
      __$empSkillsObjectCopyWithImpl<_empSkillsObject>(this, _$identity);
}

abstract class _empSkillsObject implements empSkillsObject {
  factory _empSkillsObject(String userID, String Date, int GradeId,
      int QualificationId, int EmployeeId) = _$_empSkillsObject;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  String get Date => throw _privateConstructorUsedError;
  @override
  int get GradeId => throw _privateConstructorUsedError;
  @override
  int get QualificationId => throw _privateConstructorUsedError;
  @override
  int get EmployeeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$empSkillsObjectCopyWith<_empSkillsObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$empAcademicDegreeObjectTearOff {
  const _$empAcademicDegreeObjectTearOff();

  _empAcademicDegreeObject call(
      String userID,
      int Id,
      String Major,
      String University,
      String Notes,
      int EmployeeId,
      int AcademicDegreeTypeId,
      int GradeId,
      String DegreeDate) {
    return _empAcademicDegreeObject(
      userID,
      Id,
      Major,
      University,
      Notes,
      EmployeeId,
      AcademicDegreeTypeId,
      GradeId,
      DegreeDate,
    );
  }
}

/// @nodoc
const $empAcademicDegreeObject = _$empAcademicDegreeObjectTearOff();

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
      _$empAcademicDegreeObjectCopyWithImpl<$Res>;
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
class _$empAcademicDegreeObjectCopyWithImpl<$Res>
    implements $empAcademicDegreeObjectCopyWith<$Res> {
  _$empAcademicDegreeObjectCopyWithImpl(this._value, this._then);

  final empAcademicDegreeObject _value;
  // ignore: unused_field
  final $Res Function(empAcademicDegreeObject) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? Id = freezed,
    Object? Major = freezed,
    Object? University = freezed,
    Object? Notes = freezed,
    Object? EmployeeId = freezed,
    Object? AcademicDegreeTypeId = freezed,
    Object? GradeId = freezed,
    Object? DegreeDate = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      Id: Id == freezed
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as int,
      Major: Major == freezed
          ? _value.Major
          : Major // ignore: cast_nullable_to_non_nullable
              as String,
      University: University == freezed
          ? _value.University
          : University // ignore: cast_nullable_to_non_nullable
              as String,
      Notes: Notes == freezed
          ? _value.Notes
          : Notes // ignore: cast_nullable_to_non_nullable
              as String,
      EmployeeId: EmployeeId == freezed
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
      AcademicDegreeTypeId: AcademicDegreeTypeId == freezed
          ? _value.AcademicDegreeTypeId
          : AcademicDegreeTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      GradeId: GradeId == freezed
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      DegreeDate: DegreeDate == freezed
          ? _value.DegreeDate
          : DegreeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$empAcademicDegreeObjectCopyWith<$Res>
    implements $empAcademicDegreeObjectCopyWith<$Res> {
  factory _$empAcademicDegreeObjectCopyWith(_empAcademicDegreeObject value,
          $Res Function(_empAcademicDegreeObject) then) =
      __$empAcademicDegreeObjectCopyWithImpl<$Res>;
  @override
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
class __$empAcademicDegreeObjectCopyWithImpl<$Res>
    extends _$empAcademicDegreeObjectCopyWithImpl<$Res>
    implements _$empAcademicDegreeObjectCopyWith<$Res> {
  __$empAcademicDegreeObjectCopyWithImpl(_empAcademicDegreeObject _value,
      $Res Function(_empAcademicDegreeObject) _then)
      : super(_value, (v) => _then(v as _empAcademicDegreeObject));

  @override
  _empAcademicDegreeObject get _value =>
      super._value as _empAcademicDegreeObject;

  @override
  $Res call({
    Object? userID = freezed,
    Object? Id = freezed,
    Object? Major = freezed,
    Object? University = freezed,
    Object? Notes = freezed,
    Object? EmployeeId = freezed,
    Object? AcademicDegreeTypeId = freezed,
    Object? GradeId = freezed,
    Object? DegreeDate = freezed,
  }) {
    return _then(_empAcademicDegreeObject(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      Id == freezed
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as int,
      Major == freezed
          ? _value.Major
          : Major // ignore: cast_nullable_to_non_nullable
              as String,
      University == freezed
          ? _value.University
          : University // ignore: cast_nullable_to_non_nullable
              as String,
      Notes == freezed
          ? _value.Notes
          : Notes // ignore: cast_nullable_to_non_nullable
              as String,
      EmployeeId == freezed
          ? _value.EmployeeId
          : EmployeeId // ignore: cast_nullable_to_non_nullable
              as int,
      AcademicDegreeTypeId == freezed
          ? _value.AcademicDegreeTypeId
          : AcademicDegreeTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      GradeId == freezed
          ? _value.GradeId
          : GradeId // ignore: cast_nullable_to_non_nullable
              as int,
      DegreeDate == freezed
          ? _value.DegreeDate
          : DegreeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_empAcademicDegreeObject implements _empAcademicDegreeObject {
  _$_empAcademicDegreeObject(
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
        (other is _empAcademicDegreeObject &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.Id, Id) ||
                const DeepCollectionEquality().equals(other.Id, Id)) &&
            (identical(other.Major, Major) ||
                const DeepCollectionEquality().equals(other.Major, Major)) &&
            (identical(other.University, University) ||
                const DeepCollectionEquality()
                    .equals(other.University, University)) &&
            (identical(other.Notes, Notes) ||
                const DeepCollectionEquality().equals(other.Notes, Notes)) &&
            (identical(other.EmployeeId, EmployeeId) ||
                const DeepCollectionEquality()
                    .equals(other.EmployeeId, EmployeeId)) &&
            (identical(other.AcademicDegreeTypeId, AcademicDegreeTypeId) ||
                const DeepCollectionEquality().equals(
                    other.AcademicDegreeTypeId, AcademicDegreeTypeId)) &&
            (identical(other.GradeId, GradeId) ||
                const DeepCollectionEquality()
                    .equals(other.GradeId, GradeId)) &&
            (identical(other.DegreeDate, DegreeDate) ||
                const DeepCollectionEquality()
                    .equals(other.DegreeDate, DegreeDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(Id) ^
      const DeepCollectionEquality().hash(Major) ^
      const DeepCollectionEquality().hash(University) ^
      const DeepCollectionEquality().hash(Notes) ^
      const DeepCollectionEquality().hash(EmployeeId) ^
      const DeepCollectionEquality().hash(AcademicDegreeTypeId) ^
      const DeepCollectionEquality().hash(GradeId) ^
      const DeepCollectionEquality().hash(DegreeDate);

  @JsonKey(ignore: true)
  @override
  _$empAcademicDegreeObjectCopyWith<_empAcademicDegreeObject> get copyWith =>
      __$empAcademicDegreeObjectCopyWithImpl<_empAcademicDegreeObject>(
          this, _$identity);
}

abstract class _empAcademicDegreeObject implements empAcademicDegreeObject {
  factory _empAcademicDegreeObject(
      String userID,
      int Id,
      String Major,
      String University,
      String Notes,
      int EmployeeId,
      int AcademicDegreeTypeId,
      int GradeId,
      String DegreeDate) = _$_empAcademicDegreeObject;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  int get Id => throw _privateConstructorUsedError;
  @override
  String get Major => throw _privateConstructorUsedError;
  @override
  String get University => throw _privateConstructorUsedError;
  @override
  String get Notes => throw _privateConstructorUsedError;
  @override
  int get EmployeeId => throw _privateConstructorUsedError;
  @override
  int get AcademicDegreeTypeId => throw _privateConstructorUsedError;
  @override
  int get GradeId => throw _privateConstructorUsedError;
  @override
  String get DegreeDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$empAcademicDegreeObjectCopyWith<_empAcademicDegreeObject> get copyWith =>
      throw _privateConstructorUsedError;
}
