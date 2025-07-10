
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_employee_vacations/vacation_entitlement_state.dart';
import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/use_case/get_vacation_entitlements_use_case.dart';

const String _entitlementsCacheKey = "CACHED_VACATION_ENTITLEMENTS";
const String _entitlementsCacheTimeKey = "CACHED_VACATION_ENTITLEMENTS_TIME";

class VacationEntitlementCubit extends Cubit<VacationEntitlementState> {
  final GetVacationEntitlementsUseCase getVacationEntitlementsUseCase;
  final AppPreferences appPreferences;

  VacationEntitlementCubit({
    required this.getVacationEntitlementsUseCase,
    required this.appPreferences,
  }) : super(VacationEntitlementState());

  Future<void> loadEntitlements() async {
    if (isClosed) return;

    emit(state.copyWith(isEntitlementsLoading: true));

    final cachedData = await appPreferences.getCachedEntitlements(_entitlementsCacheKey);
    final cachedTime = await appPreferences.getCachedEntitlementsTime(_entitlementsCacheTimeKey);
    final isCacheValid = cachedTime != null &&
        DateTime.now().difference(cachedTime).inMinutes < 5;

    if (cachedData != null && isCacheValid) {
      emit(state.copyWith(
        isEntitlementsLoading: false,
        entitlements: cachedData,
      ));
    } else {
      final result = await getVacationEntitlementsUseCase();

      if (isClosed) return;

      result.fold(
            (Failure failure) {
          emit(state.copyWith(
            isEntitlementsLoading: false,
            errorMessage: failure.message,
          ));
        },
            (List<VacationTypeBalancs> data) async {
          emit(state.copyWith(
            isEntitlementsLoading: false,
            entitlements: data,
          ));
          await appPreferences.setCachedEntitlements(_entitlementsCacheKey, data);
          await appPreferences.setCachedEntitlementsTime(_entitlementsCacheTimeKey, DateTime.now());
        },
      );
    }
  }
}