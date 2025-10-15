import 'package:e_commerce_app_task/features/home/domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel({required super.rate, required super.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}
