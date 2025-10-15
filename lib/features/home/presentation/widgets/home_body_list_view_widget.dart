import 'package:e_commerce_app_task/features/home/presentation/cubit/product_cubit.dart';
import 'package:e_commerce_app_task/features/home/presentation/cubit/product_state.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/empty_state_widget.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/error_state_widget.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/loading_state_widget.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/product_grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyListViewWidget extends StatelessWidget {
  final String selectedCategory;

  const HomeBodyListViewWidget({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await context.read<ProductCubit>().getProducts(0),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, productState) {
          if (productState is ProductLoading) {
            return const LoadingStateWidget();
          } else if (productState is ProductError) {
            return ErrorStateWidget(errorMessage: productState.errorMessage);
          } else if (productState is ProductSuccess) {
            var products = productState.products;

            if (selectedCategory != "All Products") {
              products = products
                  .where((p) => p.category == selectedCategory)
                  .toList();
            }

            if (products.isEmpty) {
              return const EmptyStateWidget();
            }

            return ProductGridViewWidget(products: products);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
