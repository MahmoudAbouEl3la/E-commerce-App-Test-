import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String errorMessage;
  ProductError({required this.errorMessage});
}

class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  ProductSuccess({required this.products});
}

class ProductPaginationLoading extends ProductState {
  final List<ProductEntity> product;
  ProductPaginationLoading({required this.product});
}

class ProductPaginationFailure extends ProductState {
  final String errorMessage;
  ProductPaginationFailure(this.errorMessage);
}
