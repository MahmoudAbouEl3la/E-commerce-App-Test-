import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/search/data/data_source/remote_data_source_search/search_remote_data_source.dart';
import 'package:e_commerce_app_task/features/search/domain/repos/search_repos.dart';

class SearchReposImpl extends SearchRepos {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchReposImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchsearchBooks({
    required String query,
    int page = 0,
  }) async {
    try {
      final books = await searchRemoteDataSource.fetchsearchProducts(
        page: page,
        query: query,
      );
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioError(e));
      }
      return Left(ServerFailures(message: e.toString()));
    }
  }
}
