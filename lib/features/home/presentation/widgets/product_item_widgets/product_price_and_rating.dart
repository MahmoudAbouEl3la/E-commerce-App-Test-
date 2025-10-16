import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductPriceAndRating extends StatelessWidget {
  const ProductPriceAndRating({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Iconsax.star1, color: Colors.orange, size: 20),
              const SizedBox(width: 2),
              Text(
                "(${product.rating.rate})",
                style: const TextStyle(fontSize: 12, color: Color(0xFF8D8D8D)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
