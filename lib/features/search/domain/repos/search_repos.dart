import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

abstract class SearchRepos {
  Future<Either<Failure, List<ProductEntity>>> fetchsearchBooks({
    required String query,
    int page = 0,
  });
}
