import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';

abstract class WishListState {}

class WishListInitial extends WishListState {}

class WishListLoading extends WishListState {}

class WishListError extends WishListState {
  final String errorMessage;
  WishListError({required this.errorMessage});
}

class WishListSuccess extends WishListState {
  final List<ProductEntity> products;
  WishListSuccess({required this.products});
}
