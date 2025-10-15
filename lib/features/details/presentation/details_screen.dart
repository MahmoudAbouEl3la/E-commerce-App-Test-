import 'package:e_commerce_app_task/features/details/presentation/widgets/details_product_body.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailsProductBody(product: productEntity));
  }
}
