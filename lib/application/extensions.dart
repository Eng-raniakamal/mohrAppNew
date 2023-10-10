// extension on String

import 'package:mohr_hr/data/mapper/mapper.dart';


extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on Integer
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}
extension NonNullDouble on double {
  double ordoubleZero() {
    if (this == null) {
      return DOUBLE_ZERO;
    } else {
      return this;
    }
  }
}

extension NonNullDateTime on DateTime {
  DateTime orDateTimeNull() {
    if (this == null) {
      return DT_EMPTY;
    } else {
      return this;
    }
  }
}

  extension NonNullBool on bool? {
  bool orfalse() {
  if (this == null) {
  return false;
  } else {
  return this!;
  }
  }

}
