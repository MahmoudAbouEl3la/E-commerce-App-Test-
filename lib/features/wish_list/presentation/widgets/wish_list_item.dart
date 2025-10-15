import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/widgets/product_info.dart';
import 'package:flutter/material.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withValues(alpha: 0.7),
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(1, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: Image.network(
              product.image,
              fit: BoxFit.fill,
              width: size.width * 0.3,
              height: size.height * 0.15,
            ),
          ),
          Expanded(child: ProductInfo(product: product)),
        ],
      ),
    );
  }
}
