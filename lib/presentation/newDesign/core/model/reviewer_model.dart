import 'package:equatable/equatable.dart';

class ReviewerModel extends Equatable {
  final String? id;
  final String? name;
  final bool? isCertified; //معتمده
  final bool? isUnderReview; //تحت التدقيق
  final bool? isRejected; //مرفوض

  const ReviewerModel({
    this.isCertified,
    this.isUnderReview,
    this.isRejected,
    this.id,
    this.name,
  });
  factory ReviewerModel.fromJson(Map<String, dynamic> json) {
    return ReviewerModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      isCertified: json['isCertified'] as bool?,
      isUnderReview: json['isUnderReview'] as bool?,
      isRejected: json['isRejected'] as bool?,
    );
  }
  @override
  List<Object?> get props => [id, name,  isCertified, isUnderReview, isRejected];
}
