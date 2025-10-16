import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    super.key,
    required this.product,
    required this.isFavourite,
  });
  final ProductEntity product;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.pop(true),
          icon: Icon(Iconsax.arrow_left_1, color: kPrimaryColor),
        ),
        const Text(
          "Details Product",
          style: TextStyle(
            fontSize: 20,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_outline_outlined,
            color: Colors.redAccent,
            size: 30,
          ),
          onPressed: () {
            context.read<WishListCubit>().toggleFavourite(product);
          },
        ),
      ],
    );
  }
}
