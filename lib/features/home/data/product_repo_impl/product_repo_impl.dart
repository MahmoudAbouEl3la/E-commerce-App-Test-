import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/features/home/data/product_data_source/product_remote_data_source.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/home/domain/product_repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepoImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required int page,
  }) async {
    try {
      final response = await productRemoteDataSource.getProduct(page: page);
      return Right(response);
    } on DioException catch (error) {
      return Left(ServerFailures.fromDioError(error));
    } catch (error) {
      return Left(ServerFailures(message: error.toString()));
    }
  }
}
