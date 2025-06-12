import 'package:essmohr/presentation/newDesign/feature/vacation/domain/entity/vacation_type_entity.dart';

class VacationTypeModel extends VacationTypeEntity {

  const VacationTypeModel({
    super.id,
    super.name,
    super.type,
    super.balance,
    super.limit,
    super.requiredAttachment,
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

}
