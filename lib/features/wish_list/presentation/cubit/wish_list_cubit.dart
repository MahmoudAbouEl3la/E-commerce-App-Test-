import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/data/repos/wish_list_repo_impl.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListState> {
  final WishListRepoImpl wishListRepoImpl;
  WishListCubit({required this.wishListRepoImpl}) : super(WishListInitial());

  Future<void> getAllWishListData() async {
    emit(WishListLoading());
    try {
      final products = await wishListRepoImpl.getAllWishList();
      emit(WishListSuccess(products: products));
    } catch (e) {
      emit(WishListError(errorMessage: e.toString()));
    }
  }

  Future<void> removeFromWishList(int id) async {
    await wishListRepoImpl.removeFromWishList(id);
    getAllWishListData();
  }

  Future<void> toggleFavourite(ProductEntity product) async {
    if (wishListRepoImpl.isFavourite(product.id)) {
      await removeFromWishList(product.id);
    } else {
      await wishListRepoImpl.addToWishList(product);
    }
    await getAllWishListData();
  }

  bool isFavourite(int id) {
    return wishListRepoImpl.isFavourite(id);
  }
}
