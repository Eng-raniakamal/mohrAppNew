import '../../../../../../../domain/model/model.dart';

class VacationEntitlementState {
  final bool isLoading;
  final bool isEntitlementsLoading;
  final String? errorMessage;
  final List<VacationTypeBalancs>? entitlements;

  VacationEntitlementState({
    this.isLoading = false,
    this.isEntitlementsLoading = false,
    this.errorMessage,
    this.entitlements,
  });

  VacationEntitlementState copyWith({
    bool? isLoading,
    bool? isEntitlementsLoading,
    String? errorMessage,
    List<VacationTypeBalancs>? entitlements,
  }) {
    return VacationEntitlementState(
      isLoading: isLoading ?? this.isLoading,
      isEntitlementsLoading: isEntitlementsLoading ?? this.isEntitlementsLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      entitlements: entitlements ?? this.entitlements,
    );
  }
}