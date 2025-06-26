import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entity/vacation_type_entity.dart';

class VacationTypeState extends Equatable {
  final List<VacationTypeModel> vacationTypes;
  final VacationTypeModel? selectedVacation;
  final bool isLoading;
  final String? errorMessage;

  const VacationTypeState({
    this.vacationTypes = const [],
    this.selectedVacation,
    this.isLoading = false,
    this.errorMessage,
  });

  VacationTypeState copyWith({
    List<VacationTypeModel>? vacationTypes,
    VacationTypeModel? selectedVacation,
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
