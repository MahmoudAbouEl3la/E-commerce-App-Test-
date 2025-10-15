import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

abstract class SearchProductsState {}

class SearchProductsInitial extends SearchProductsState {}

class SearchProductsLoading extends SearchProductsState {}

class SearchProductsFailure extends SearchProductsState {
  final String errMessage;

  SearchProductsFailure(this.errMessage);
}

class SearchProductsSuccess extends SearchProductsState {
  final List<ProductEntity> products;

  SearchProductsSuccess(this.products);
}

class SearchBooksPaginationLoading extends SearchProductsState {
  final List<ProductEntity> products;

  SearchBooksPaginationLoading(this.products);
}

class SearchBooksPaginationFailure extends SearchProductsState {
  final String errMessage;

  SearchBooksPaginationFailure(this.errMessage);
}
