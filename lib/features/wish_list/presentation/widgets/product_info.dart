import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<WishListCubit>().removeFromWishList(product.id);
                },
                icon: Icon(Iconsax.trash, color: Colors.red, size: 22),
              ),
            ],
          ),
          Text(
            product.category,
            style: TextStyle(
              color: kPrimaryColor.withValues(alpha: 0.8),
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          Row(
            children: [
              Text(
                "\$${product.price}".toString(),
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.deepOrange),
                  const SizedBox(width: 5),
                  Text(
                    "(${product.rating.rate})".toString(),
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
