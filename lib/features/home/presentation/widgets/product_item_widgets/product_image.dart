import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
    required this.isFavourite,
  });

  final ProductEntity product;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.network(
            product.image,
            height: size.height * 0.18,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () {
              context.read<WishListCubit>().toggleFavourite(product);
            },
            child: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_outline_outlined,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
