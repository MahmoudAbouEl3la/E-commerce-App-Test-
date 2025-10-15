import 'package:e_commerce_app_task/features/home/domain/entities/rating_entity.dart';
import 'package:hive_flutter/adapters.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final RatingEntity rating;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
    id: json['id'] as int,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
    category: json['category'] as String,
    image: json['image'] as String,
    rating: RatingEntity.fromJson(json['rating'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating.toJson(),
  };
}
