import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            product.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: kGreyColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Price: \$${product.price}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text(
                    "(${product.rating.rate})",
                    style: const TextStyle(color: kPrimaryColor),
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
