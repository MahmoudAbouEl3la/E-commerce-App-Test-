import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';

class WishListBody extends StatelessWidget {
  const WishListBody({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (products.isEmpty) {
      return const Center(child: Text("No items in your wishlist yet"));
    }
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: size.height * 0.015),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return WishListItem(product: products[index]);
        },
      ),
    );
  }
}
