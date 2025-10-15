import 'package:dio/dio.dart';
import 'package:e_commerce_app_task/core/utilies/api_service.dart';
import 'package:e_commerce_app_task/features/auth/login/data/data_source/remote_data_source/login_remote_data_source_impl.dart';
import 'package:e_commerce_app_task/features/auth/login/data/login_repo_impl/login_repo_impl.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app_task/features/home/data/product_data_source/product_remote_data_source_impl.dart';
import 'package:e_commerce_app_task/features/home/data/product_repo_impl/product_repo_impl.dart';
import 'package:e_commerce_app_task/features/home/domain/product_use_case/product_use_case.dart';
import 'package:e_commerce_app_task/features/search/data/data_source/remote_data_source_search/search_remote_data_source_impl.dart';
import 'package:e_commerce_app_task/features/search/data/search_repos_impl/search_repos_impl.dart';
import 'package:e_commerce_app_task/features/search/domain/search_use_case/search_products_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      loginRemoteDataSource: LoginRemoteDataSourceImpl(
        apiServise: getIt<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<LoginUseCase>(
    LoginUseCase(loginRepo: getIt<LoginRepoImpl>()),
  );

  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(
      productRemoteDataSource: ProductRemoteDataSourceImpl(
        apiServise: getIt<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<ProductUseCase>(
    ProductUseCase(productRepo: getIt<ProductRepoImpl>()),
  );

  getIt.registerSingleton<SearchReposImpl>(
    SearchReposImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
        apiService: getIt<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<SearchProductsUseCase>(
    SearchProductsUseCase(searchRepos: getIt<SearchReposImpl>()),
  );
}
