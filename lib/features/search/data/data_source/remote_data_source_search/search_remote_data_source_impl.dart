import 'package:e_commerce_app_task/core/utilies/api_service.dart';
import 'package:e_commerce_app_task/features/home/data/products_model/products_model.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/search/data/data_source/remote_data_source_search/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ProductEntity>> fetchsearchProducts({
    required String query,
    int page = 0,
  }) async {
    final data = await apiService.getProducts(endPoint: ApiService.products);

    List<ProductEntity> allProducts = (data)
        .map((item) => ProductsModel.fromJson(item))
        .toList();

    final filtered = allProducts.where((product) {
      final q = query.toLowerCase();
      return product.title.toLowerCase().contains(q) ||
          product.category.toLowerCase().contains(q) ||
          product.description.toLowerCase().contains(q);
    }).toList();

    return filtered;
  }
}
