import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/domain/wish_list_repo.dart';
import 'package:hive_flutter/adapters.dart';

class WishListRepoImpl extends WishListRepo {
  final Box<ProductEntity> box;

  WishListRepoImpl({required this.box});

  @override
  Future<void> addToWishList(ProductEntity product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeFromWishList(int id) async {
    await box.delete(id);
  }

  @override
  Future<List<ProductEntity>> getAllWishList() async {
    return box.values.toList();
  }

  @override
  bool isFavourite(int id) {
    return box.containsKey(id);
  }
}
