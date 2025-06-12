import 'package:equatable/equatable.dart';
import '../../../domain/entity/vacation_type_entity.dart';

class VacationTypeState extends Equatable {
  final List<VacationTypeEntity> vacationTypes;
  final VacationTypeEntity? selectedVacation;
  final bool isLoading;
  final String? errorMessage;

  const VacationTypeState({
    this.vacationTypes = const [],
    this.selectedVacation,
    this.isLoading = false,
    this.errorMessage,
  });

  VacationTypeState copyWith({
    List<VacationTypeEntity>? vacationTypes,
    VacationTypeEntity? selectedVacation,
    bool? isLoading,
    String? errorMessage,
  }) {
    return VacationTypeState(
      vacationTypes: vacationTypes ?? this.vacationTypes,
      selectedVacation: selectedVacation ?? this.selectedVacation,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [vacationTypes, selectedVacation, isLoading, errorMessage];
}
