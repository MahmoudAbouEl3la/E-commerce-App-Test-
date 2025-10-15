import 'package:e_commerce_app_task/features/search/domain/manager/cubit/search_products_state.dart';
import 'package:e_commerce_app_task/features/search/domain/search_use_case/search_products_use_case.dart';
import 'package:e_commerce_app_task/features/search/domain/search_use_case/search_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  final SearchProductsUseCase fetchSearchProductsUseCase;
  String currentQuery = '';

  SearchProductsCubit({required this.fetchSearchProductsUseCase})
    : super(SearchProductsInitial());

  Future<void> fetchSearchProducts({
    required String query,
    int page = 0,
  }) async {
    if (query.isEmpty) {
      resetSearch();
      return;
    }

    currentQuery = query;
    if (state is SearchProductsSuccess && page > 0) {
      final oldProducts = (state as SearchProductsSuccess).products;
      emit(SearchBooksPaginationLoading(oldProducts));
      var failureOrBooks = await fetchSearchProductsUseCase(
        SearchParams(query: query, page: page),
      );
      emit(
        failureOrBooks.fold(
          (failure) => SearchBooksPaginationFailure(failure.toString()),
          (products) => SearchProductsSuccess([...oldProducts, ...products]),
        ),
      );
      return;
    }

    emit(SearchProductsLoading());
    var failureOrProducts = await fetchSearchProductsUseCase(
      SearchParams(query: query, page: page),
    );
    emit(
      failureOrProducts.fold(
        (failure) => SearchProductsFailure(failure.toString()),
        (books) => SearchProductsSuccess(books),
      ),
    );
  }

  void resetSearch() {
    currentQuery = '';
    emit(SearchProductsInitial());
  }
}
