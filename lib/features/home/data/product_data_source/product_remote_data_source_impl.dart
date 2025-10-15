import 'package:e_commerce_app_task/core/utilies/api_service.dart';
import 'package:e_commerce_app_task/features/home/data/product_data_source/product_remote_data_source.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ApiService apiServise;
  ProductRemoteDataSourceImpl({required this.apiServise});
  @override
  Future<List<ProductEntity>> getProduct({int page = 0}) async {
    final response = await apiServise.getProducts(
      endPoint: ApiService.products,
    );
    return response
        .map((productJson) => ProductEntity.fromJson(productJson))
        .toList();
  }
}
