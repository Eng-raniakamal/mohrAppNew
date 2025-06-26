import 'package:equatable/equatable.dart';

class ApproveCancelRequestState extends Equatable{
  final bool isLoading;
  final String? errorMessage;
  final bool ?isSuccess;

  const ApproveCancelRequestState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess ,
  });

  ApproveCancelRequestState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ApproveCancelRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    isSuccess,
  ];
}