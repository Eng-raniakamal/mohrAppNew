import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_requests/get_vacation_requests_response_model.dart';


class GetVacationRequestsResponseState{
  bool ?isLoading= false;
  String? errorMessage;
  List<GetVacationRequestsResponseModel>? response;

  GetVacationRequestsResponseState({this.isLoading, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetVacationRequestsResponseModel>? response,
  }) {
    return GetVacationRequestsResponseState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }

}