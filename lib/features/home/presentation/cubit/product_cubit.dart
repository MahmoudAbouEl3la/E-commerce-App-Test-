import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/home/domain/product_use_case/product_use_case.dart';
import 'package:e_commerce_app_task/features/home/presentation/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUseCase productUseCase;
  List<ProductEntity> allProducts = [];
  ProductCubit({required this.productUseCase}) : super(ProductInitial());

  Future<void> getProducts(int page) async {
    try {
      if (page > 0 && state is ProductSuccess) {
        final oldProducts = (state as ProductSuccess).products;
        final newProducts = await productUseCase.call(page);
        newProducts.fold(
          (failure) => emit(ProductPaginationFailure(failure.message)),
          (products) =>
              emit(ProductSuccess(products: [...oldProducts, ...products])),
        );
      } else {
        emit(ProductLoading());
        final result = await productUseCase.call(page);
        result.fold(
          (failure) => emit(ProductError(errorMessage: failure.message)),
          (products) => emit(ProductSuccess(products: products)),
        );
      }
    } catch (e) {
      emit(ProductError(errorMessage: e.toString()));
    }
  }

  // void filterProductByCategory(String category) {
  //   final filteredProducts = allProducts
  //       .where((product) => product.category == category)
  //       .toList();
  //   emit(ProductSuccess(products: filteredProducts));
  // }

  // void resetcategory() {
  //   emit(ProductSuccess(products: allProducts));
  // }
}
