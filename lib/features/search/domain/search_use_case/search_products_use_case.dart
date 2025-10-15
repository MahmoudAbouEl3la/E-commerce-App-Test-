import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/search/domain/repos/search_repos.dart';
import 'package:e_commerce_app_task/features/search/domain/search_use_case/search_params.dart';
import 'package:e_commerce_app_task/features/search/domain/search_use_case/search_use_case_with_param.dart';

class SearchProductsUseCase
    extends SearchUseCaseWithParam<List<ProductEntity>, SearchParams> {
  final SearchRepos searchRepos;

  SearchProductsUseCase({required this.searchRepos});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(SearchParams params) {
    return searchRepos.fetchsearchBooks(query: params.query, page: params.page);
  }
}
