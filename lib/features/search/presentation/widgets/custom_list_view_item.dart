import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/search/presentation/widgets/search_products_details.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * .17, child: SizedBox()),
          SearchProductsDetails(productEntity: productEntity),
        ],
      ),
    );
  }
}
