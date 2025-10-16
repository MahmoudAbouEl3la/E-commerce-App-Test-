import 'package:e_commerce_app_task/features/details/presentation/widgets/details_carousel.dart';
import 'package:e_commerce_app_task/features/details/presentation/widgets/details_header.dart';
import 'package:e_commerce_app_task/features/details/presentation/widgets/details_info.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsProductBody extends StatelessWidget {
  const DetailsProductBody({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final wishListCubit = context.watch<WishListCubit>();
    final isFavourite = wishListCubit.isFavourite(product.id);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(true);
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DetailsHeader(product: product, isFavourite: isFavourite),
                const SizedBox(height: 10),
                DetailsCarousel(image: product.image),
                const SizedBox(height: 20),
                DetailsInfo(product: product),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
