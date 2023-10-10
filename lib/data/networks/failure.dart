import 'package:mohr_hr/data/networks/error_handler.dart';


class Failure {
  int code; // 200 ,201,303,500, 400
  String message; // error or success
  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
