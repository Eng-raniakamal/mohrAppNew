import 'package:essmohr/presentation/newDesign/core/model/reviewer_model.dart';
import 'package:equatable/equatable.dart';


class GetEmployeeVacationsModel extends Equatable {
  final String? id;
  final String? typeName; // agaza mardiya, agaza sanawiya
  final bool? isCertified; //معتمده
  final bool? isUnderReview; //تحت التدقيق
  final bool? isRejected; //مرفوض
  final String? fromDate;
  final String? toDate;
  final int? availableBalance;
  final int? balanceWithdrawals;
  final int? duration; //// مدة الاجازة
  final String? notes;
  final String? employeeSecondName;
  final List<ReviewerModel?>? reviewer;


  const GetEmployeeVacationsModel({
    this.id,
    this.typeName,
    this.isCertified,
    this.isUnderReview,
    this.isRejected,
    this.fromDate,
    this.toDate,
    this.availableBalance,
    this.balanceWithdrawals,
    this.duration,
    this.reviewer,
    this.notes,
    this.employeeSecondName,
  });

  factory GetEmployeeVacationsModel.fromJson(Map<String, dynamic> json) {
    return GetEmployeeVacationsModel(
      id: json['id'] as String?,
      typeName: json['name'] as String?,
      isCertified: json['isCertified'] as bool?,
      isUnderReview: json['isUnderReview'] as bool?,
      isRejected: json['isRejected'] as bool?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      availableBalance: json['availableBalance'] as int?,
      balanceWithdrawals: json['balanceWithdrawals'] as int?,
      duration: json['duration'] as int?,
      reviewer: (json['reviewer'] as List?)
          ?.map((e) => ReviewerModel.fromJson(e as Map<String, dynamic>))
          .toList() ,
      notes: json['notes'] as String?,
      employeeSecondName: json['employeeSecondName'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    id,
    typeName,
    isCertified,
    isUnderReview,
    isRejected,
    fromDate,
    toDate,
    availableBalance,
    balanceWithdrawals,
    duration,
    reviewer,
    notes,
    employeeSecondName,
  ];

  static final List<GetEmployeeVacationsModel> listVacationEmployee = [
    GetEmployeeVacationsModel(
      typeName: "اجازة مرضية",
      isUnderReview: true,
      balanceWithdrawals: 3,
      availableBalance: 234,
      fromDate: "10 نوفمبر2024",
      toDate: "11 نوفمبر2024",
      duration: 12,
 employeeSecondName: "محمد فتحى غانم",
      reviewer:[
        ReviewerModel(
          id: "1",
          name: "محمد علي",
          isCertified: true,
        ),
        ReviewerModel(
          id: "2",
          name: "أحمد سعيد",
          isUnderReview: true,
        ),

      ],
      notes: "example notes for sick leave",
    ),
    GetEmployeeVacationsModel(
      typeName: "اجازة حج",
      isCertified: true,
      balanceWithdrawals: 1,
      availableBalance: 100,
      fromDate: "22 نوفمبر2024",
      toDate: "22 نوفمبر2024",
      duration: 20,
    ),
    GetEmployeeVacationsModel(
      typeName: "اجازة عرضة",
      isRejected: true,
      balanceWithdrawals: 1,
      availableBalance: 100,
      fromDate: "22 نوفمبر2024",
      toDate: "22 نوفمبر2024",
      duration: 1,
    ),

    GetEmployeeVacationsModel(
      typeName: "اجازة مرضية",
      isUnderReview: true,
      balanceWithdrawals: 3,
      availableBalance: 234,
      fromDate: "10 نوفمبر2024",
      toDate: "11 نوفمبر2024",
      duration: 12,
      employeeSecondName: "محمد فتحى غانم",
      reviewer:[
        ReviewerModel(
          id: "1",
          name: "محمد علي",
          isCertified: true,
        ),
        ReviewerModel(
          id: "2",
          name: "أحمد سعيد",
          isUnderReview: true,
        ),

      ],
      notes: "example notes for sick leave",
    ),
    GetEmployeeVacationsModel(
      typeName: "اجازة حج",
      isCertified: true,
      balanceWithdrawals: 1,
      availableBalance: 100,
      fromDate: "22 نوفمبر2024",
      toDate: "22 نوفمبر2024",
      duration: 20,
    ),
    GetEmployeeVacationsModel(
      typeName: "اجازة عرضة",
      isRejected: true,
      balanceWithdrawals: 1,
      availableBalance: 100,
      fromDate: "22 نوفمبر2024",
      toDate: "22 نوفمبر2024",
      duration: 1,
    ),
  ];




}

