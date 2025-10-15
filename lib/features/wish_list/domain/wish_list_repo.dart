import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

abstract class WishListRepo {
  Future<void> addToWishList(ProductEntity product);
  Future<void> removeFromWishList(int id);
  Future<List<ProductEntity>> getAllWishList();
  bool isFavourite(int id);
}
