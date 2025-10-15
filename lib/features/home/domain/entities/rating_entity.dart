import 'package:hive_flutter/adapters.dart';

part 'rating_entity.g.dart';

@HiveType(typeId: 0)
class RatingEntity {
  @HiveField(0)
  final double? rate;
  @HiveField(1)
  final int? count;

  RatingEntity({required this.rate, required this.count});

  factory RatingEntity.fromJson(Map<String, dynamic> json) {
    return RatingEntity(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}
