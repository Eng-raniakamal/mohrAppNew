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
class _$empBasicDataObjectTearOff {
  const _$empBasicDataObjectTearOff();

  _empBasicDataObject call(
      String userID,
      String ArabicName,
      String EnglishName,
      String BirthDate,
      String NationalId,
      String SocialId,
      String Email,
      String Phone,
      String Emergency_Number,
      String AddressText,
      int DistrictId,
      String PoBox,
      String ZipCode) {
    return _empBasicDataObject(
      userID,
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
    );
  }
}

/// @nodoc
const $empBasicDataObject = _$empBasicDataObjectTearOff();

/// @nodoc
mixin _$empBasicDataObject {
  String get userID => throw _privateConstructorUsedError;
  String get ArabicName => throw _privateConstructorUsedError;
  String get EnglishName => throw _privateConstructorUsedError;
  String get BirthDate => throw _privateConstructorUsedError;
  String get NationalId => throw _privateConstructorUsedError;
  String get SocialId => throw _privateConstructorUsedError;
  String get Email => throw _privateConstructorUsedError;
  String get Phone => throw _privateConstructorUsedError;
  String get Emergency_Number => throw _privateConstructorUsedError;
  String get AddressText => throw _privateConstructorUsedError;
  int get DistrictId => throw _privateConstructorUsedError;
  String get PoBox => throw _privateConstructorUsedError;
  String get ZipCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $empBasicDataObjectCopyWith<empBasicDataObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $empBasicDataObjectCopyWith<$Res> {
  factory $empBasicDataObjectCopyWith(
          empBasicDataObject value, $Res Function(empBasicDataObject) then) =
      _$empBasicDataObjectCopyWithImpl<$Res>;
  $Res call(
      {String userID,
      String ArabicName,
      String EnglishName,
      String BirthDate,
      String NationalId,
      String SocialId,
      String Email,
      String Phone,
      String Emergency_Number,
      String AddressText,
      int DistrictId,
      String PoBox,
      String ZipCode});
}

/// @nodoc
class _$empBasicDataObjectCopyWithImpl<$Res>
    implements $empBasicDataObjectCopyWith<$Res> {
  _$empBasicDataObjectCopyWithImpl(this._value, this._then);

  final empBasicDataObject _value;
  // ignore: unused_field
  final $Res Function(empBasicDataObject) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? ArabicName = freezed,
    Object? EnglishName = freezed,
    Object? BirthDate = freezed,
    Object? NationalId = freezed,
    Object? SocialId = freezed,
    Object? Email = freezed,
    Object? Phone = freezed,
    Object? Emergency_Number = freezed,
    Object? AddressText = freezed,
    Object? DistrictId = freezed,
    Object? PoBox = freezed,
    Object? ZipCode = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      ArabicName: ArabicName == freezed
          ? _value.ArabicName
          : ArabicName // ignore: cast_nullable_to_non_nullable
              as String,
      EnglishName: EnglishName == freezed
          ? _value.EnglishName
          : EnglishName // ignore: cast_nullable_to_non_nullable
              as String,
      BirthDate: BirthDate == freezed
          ? _value.BirthDate
          : BirthDate // ignore: cast_nullable_to_non_nullable
              as String,
      NationalId: NationalId == freezed
          ? _value.NationalId
          : NationalId // ignore: cast_nullable_to_non_nullable
              as String,
      SocialId: SocialId == freezed
          ? _value.SocialId
          : SocialId // ignore: cast_nullable_to_non_nullable
              as String,
      Email: Email == freezed
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Phone: Phone == freezed
          ? _value.Phone
          : Phone // ignore: cast_nullable_to_non_nullable
              as String,
      Emergency_Number: Emergency_Number == freezed
          ? _value.Emergency_Number
          : Emergency_Number // ignore: cast_nullable_to_non_nullable
              as String,
      AddressText: AddressText == freezed
          ? _value.AddressText
          : AddressText // ignore: cast_nullable_to_non_nullable
              as String,
      DistrictId: DistrictId == freezed
          ? _value.DistrictId
          : DistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      PoBox: PoBox == freezed
          ? _value.PoBox
          : PoBox // ignore: cast_nullable_to_non_nullable
              as String,
      ZipCode: ZipCode == freezed
          ? _value.ZipCode
          : ZipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$empBasicDataObjectCopyWith<$Res>
    implements $empBasicDataObjectCopyWith<$Res> {
  factory _$empBasicDataObjectCopyWith(
          _empBasicDataObject value, $Res Function(_empBasicDataObject) then) =
      __$empBasicDataObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userID,
      String ArabicName,
      String EnglishName,
      String BirthDate,
      String NationalId,
      String SocialId,
      String Email,
      String Phone,
      String Emergency_Number,
      String AddressText,
      int DistrictId,
      String PoBox,
      String ZipCode});
}

/// @nodoc
class __$empBasicDataObjectCopyWithImpl<$Res>
    extends _$empBasicDataObjectCopyWithImpl<$Res>
    implements _$empBasicDataObjectCopyWith<$Res> {
  __$empBasicDataObjectCopyWithImpl(
      _empBasicDataObject _value, $Res Function(_empBasicDataObject) _then)
      : super(_value, (v) => _then(v as _empBasicDataObject));

  @override
  _empBasicDataObject get _value => super._value as _empBasicDataObject;

  @override
  $Res call({
    Object? userID = freezed,
    Object? ArabicName = freezed,
    Object? EnglishName = freezed,
    Object? BirthDate = freezed,
    Object? NationalId = freezed,
    Object? SocialId = freezed,
    Object? Email = freezed,
    Object? Phone = freezed,
    Object? Emergency_Number = freezed,
    Object? AddressText = freezed,
    Object? DistrictId = freezed,
    Object? PoBox = freezed,
    Object? ZipCode = freezed,
  }) {
    return _then(_empBasicDataObject(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      ArabicName == freezed
          ? _value.ArabicName
          : ArabicName // ignore: cast_nullable_to_non_nullable
              as String,
      EnglishName == freezed
          ? _value.EnglishName
          : EnglishName // ignore: cast_nullable_to_non_nullable
              as String,
      BirthDate == freezed
          ? _value.BirthDate
          : BirthDate // ignore: cast_nullable_to_non_nullable
              as String,
      NationalId == freezed
          ? _value.NationalId
          : NationalId // ignore: cast_nullable_to_non_nullable
              as String,
      SocialId == freezed
          ? _value.SocialId
          : SocialId // ignore: cast_nullable_to_non_nullable
              as String,
      Email == freezed
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Phone == freezed
          ? _value.Phone
          : Phone // ignore: cast_nullable_to_non_nullable
              as String,
      Emergency_Number == freezed
          ? _value.Emergency_Number
          : Emergency_Number // ignore: cast_nullable_to_non_nullable
              as String,
      AddressText == freezed
          ? _value.AddressText
          : AddressText // ignore: cast_nullable_to_non_nullable
              as String,
      DistrictId == freezed
          ? _value.DistrictId
          : DistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      PoBox == freezed
          ? _value.PoBox
          : PoBox // ignore: cast_nullable_to_non_nullable
              as String,
      ZipCode == freezed
          ? _value.ZipCode
          : ZipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_empBasicDataObject implements _empBasicDataObject {
  _$_empBasicDataObject(
      this.userID,
      this.ArabicName,
      this.EnglishName,
      this.BirthDate,
      this.NationalId,
      this.SocialId,
      this.Email,
      this.Phone,
      this.Emergency_Number,
      this.AddressText,
      this.DistrictId,
      this.PoBox,
      this.ZipCode);

  @override
  final String userID;
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
  final String AddressText;
  @override
  final int DistrictId;
  @override
  final String PoBox;
  @override
  final String ZipCode;

  @override
  String toString() {
    return 'empBasicDataObject(userID: $userID, ArabicName: $ArabicName, EnglishName: $EnglishName, BirthDate: $BirthDate, NationalId: $NationalId, SocialId: $SocialId, Email: $Email, Phone: $Phone, Emergency_Number: $Emergency_Number, AddressText: $AddressText, DistrictId: $DistrictId, PoBox: $PoBox, ZipCode: $ZipCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _empBasicDataObject &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.ArabicName, ArabicName) ||
                const DeepCollectionEquality()
                    .equals(other.ArabicName, ArabicName)) &&
            (identical(other.EnglishName, EnglishName) ||
                const DeepCollectionEquality()
                    .equals(other.EnglishName, EnglishName)) &&
            (identical(other.BirthDate, BirthDate) ||
                const DeepCollectionEquality()
                    .equals(other.BirthDate, BirthDate)) &&
            (identical(other.NationalId, NationalId) ||
                const DeepCollectionEquality()
                    .equals(other.NationalId, NationalId)) &&
            (identical(other.SocialId, SocialId) ||
                const DeepCollectionEquality()
                    .equals(other.SocialId, SocialId)) &&
            (identical(other.Email, Email) ||
                const DeepCollectionEquality().equals(other.Email, Email)) &&
            (identical(other.Phone, Phone) ||
                const DeepCollectionEquality().equals(other.Phone, Phone)) &&
            (identical(other.Emergency_Number, Emergency_Number) ||
                const DeepCollectionEquality()
                    .equals(other.Emergency_Number, Emergency_Number)) &&
            (identical(other.AddressText, AddressText) ||
                const DeepCollectionEquality()
                    .equals(other.AddressText, AddressText)) &&
            (identical(other.DistrictId, DistrictId) ||
                const DeepCollectionEquality()
                    .equals(other.DistrictId, DistrictId)) &&
            (identical(other.PoBox, PoBox) ||
                const DeepCollectionEquality().equals(other.PoBox, PoBox)) &&
            (identical(other.ZipCode, ZipCode) ||
                const DeepCollectionEquality().equals(other.ZipCode, ZipCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(ArabicName) ^
      const DeepCollectionEquality().hash(EnglishName) ^
      const DeepCollectionEquality().hash(BirthDate) ^
      const DeepCollectionEquality().hash(NationalId) ^
      const DeepCollectionEquality().hash(SocialId) ^
      const DeepCollectionEquality().hash(Email) ^
      const DeepCollectionEquality().hash(Phone) ^
      const DeepCollectionEquality().hash(Emergency_Number) ^
      const DeepCollectionEquality().hash(AddressText) ^
      const DeepCollectionEquality().hash(DistrictId) ^
      const DeepCollectionEquality().hash(PoBox) ^
      const DeepCollectionEquality().hash(ZipCode);

  @JsonKey(ignore: true)
  @override
  _$empBasicDataObjectCopyWith<_empBasicDataObject> get copyWith =>
      __$empBasicDataObjectCopyWithImpl<_empBasicDataObject>(this, _$identity);
}

abstract class _empBasicDataObject implements empBasicDataObject {
  factory _empBasicDataObject(
      String userID,
      String ArabicName,
      String EnglishName,
      String BirthDate,
      String NationalId,
      String SocialId,
      String Email,
      String Phone,
      String Emergency_Number,
      String AddressText,
      int DistrictId,
      String PoBox,
      String ZipCode) = _$_empBasicDataObject;

  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  String get ArabicName => throw _privateConstructorUsedError;
  @override
  String get EnglishName => throw _privateConstructorUsedError;
  @override
  String get BirthDate => throw _privateConstructorUsedError;
  @override
  String get NationalId => throw _privateConstructorUsedError;
  @override
  String get SocialId => throw _privateConstructorUsedError;
  @override
  String get Email => throw _privateConstructorUsedError;
  @override
  String get Phone => throw _privateConstructorUsedError;
  @override
  String get Emergency_Number => throw _privateConstructorUsedError;
  @override
  String get AddressText => throw _privateConstructorUsedError;
  @override
  int get DistrictId => throw _privateConstructorUsedError;
  @override
  String get PoBox => throw _privateConstructorUsedError;
  @override
  String get ZipCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$empBasicDataObjectCopyWith<_empBasicDataObject> get copyWith =>
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
