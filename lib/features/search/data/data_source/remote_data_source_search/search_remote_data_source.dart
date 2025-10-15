import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<ProductEntity>> fetchsearchProducts({
    int page = 0,
    required String query,
  });
}
