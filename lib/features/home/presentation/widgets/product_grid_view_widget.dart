import 'package:e_commerce_app_task/core/utilies/routes.dart';
import 'package:e_commerce_app_task/features/home/presentation/cubit/product_cubit.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/product_item_widget.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductGridViewWidget extends StatefulWidget {
  final List products;

  const ProductGridViewWidget({super.key, required this.products});

  @override
  State<ProductGridViewWidget> createState() => _ProductGridViewWidgetState();
}

class _ProductGridViewWidgetState extends State<ProductGridViewWidget> {
  late final ScrollController _scrollController;
  int page = 0;
  bool isLoading = false;
  static const percentage = 70;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * (percentage / 100) &&
        !isLoading) {
      isLoading = true;
      page++;
      context
          .read<ProductCubit>()
          .getProducts(page)
          .then((_) => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        return GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            final product = widget.products[index];
            return GestureDetector(
              onTap: () async {
                final updated = await context.push<bool>(
                  Routes.detailsScreen,
                  extra: product,
                );

                if (!context.mounted) return;

                if (updated == true) {
                  context.read<WishListCubit>().getAllWishListData();
                }
              },
              child: ProductItemWidget(product: product),
            );
          },
        );
      },
    );
  }
}
