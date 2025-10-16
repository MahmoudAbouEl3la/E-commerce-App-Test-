import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/core/utilies/routes.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/product_item_widgets/product_category.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/product_item_widgets/product_image.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/product_item_widgets/product_price_and_rating.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/product_item_widgets/product_title.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        final isFavourite = state is WishListSuccess
            ? state.products.any((p) => p.id == product.id)
            : false;

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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withValues(alpha: 0.5),
                  blurRadius: 1,
                  spreadRadius: 2,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(product: product, isFavourite: isFavourite),
                const SizedBox(height: 10),
                ProductTitle(product: product),
                const SizedBox(height: 4),
                ProductCategory(product: product),
                const Spacer(),
                ProductPriceAndRating(product: product),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
