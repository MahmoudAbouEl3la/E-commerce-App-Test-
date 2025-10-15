import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class SearchProductsDetails extends StatelessWidget {
  const SearchProductsDetails({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productEntity.title,
              style: TextStyle(color: kPrimaryColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(productEntity.title, style: TextStyle(color: kGreyColor)),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}
