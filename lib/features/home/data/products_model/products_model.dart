import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

import 'rating_model.dart';

class ProductsModel extends ProductEntity {
  ProductsModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required RatingModel super.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json['id'] ?? 0,
    title: json['title'] ?? "",
    price: (json['price'] as num?)?.toDouble() ?? 0.0,
    description: json['description'] ?? "",
    category: json['category'] ?? "",
    image: json['image'] ?? "",
    rating: RatingModel.fromJson(json['rating'] ?? {}),
  );
  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': (rating as RatingModel).toJson(),
  };
}
