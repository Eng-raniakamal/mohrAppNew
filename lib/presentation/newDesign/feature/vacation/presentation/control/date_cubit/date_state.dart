
class DateState {
  final DateTime fromDate;
  final DateTime toDate;

  DateState({required this.fromDate, required this.toDate});




  DateState copyWith({DateTime? fromDate, DateTime? toDate}) {
    return DateState(
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
  }
}