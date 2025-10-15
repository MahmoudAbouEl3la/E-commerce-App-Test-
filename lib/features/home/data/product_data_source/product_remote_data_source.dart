import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getProduct({int page = 0});
}
