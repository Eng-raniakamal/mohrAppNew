import 'package:equatable/equatable.dart';

class VacationTypeModel extends Equatable {
  final int? id;
  final String? name;
  final int? type;
  final int? balance;
  final int? limit;
  final bool? requiredAttachment;

  const VacationTypeModel({
    this.id,
    this.name,
    this.type,
    this.balance,
    this.limit,
    this.requiredAttachment,
  });

  factory VacationTypeModel.fromJson(Map<String, dynamic> json) {
    return VacationTypeModel(
      id: json['Id'],
      name: json['Name'],
      type: json['Type'],
      balance: json['Balance'],
      limit: json['Limit'],
      requiredAttachment: json['RequiredAttachment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "balance": balance,
      "limit": limit,
      "requiredAttachment": requiredAttachment,
    };
  }

  @override
  String toString() {
    return 'VacationTypeModel(id: $id, name: $name)';
  }

  @override
  List<Object?> get props => [
    id,
    name,
    type,
    balance,
    limit,
    requiredAttachment,
  ];
}
