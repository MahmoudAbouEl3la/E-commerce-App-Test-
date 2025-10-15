import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/product_item_widget.dart';
import 'package:e_commerce_app_task/features/search/domain/manager/cubit/search_products_cubit.dart';
import 'package:e_commerce_app_task/features/search/domain/manager/cubit/search_products_state.dart';
import 'package:e_commerce_app_task/features/search/presentation/widgets/search_products_list_view.dart';
import 'package:e_commerce_app_task/features/search/presentation/widgets/search_products_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewSearchPage extends StatelessWidget {
  const CustomListViewSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      builder: (context, state) {
        if (state is SearchProductsInitial) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                'Search for Products',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: kPrimaryColor),
              ),
            ),
          );
        } else if (state is SearchProductsLoading) {
          return const SearchProductsListViewLoadingIndicator();
        } else if (state is SearchProductsSuccess) {
          final products = state.products;
          if (state.products.isEmpty) {
            return const Center(
              child: Text(
                'No results found.\nTry searching for another Products.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItemWidget(product: product);
            },
          );
        } else if (state is SearchBooksPaginationLoading) {
          return SearchProductsListView(
            products: state.products,
            showLoadingIndicatorAtEnd: true,
          );
        } else if (state is SearchProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SearchProductsInitial) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                'Start searching for books using the search bar above.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
