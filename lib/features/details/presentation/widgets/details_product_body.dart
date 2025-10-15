import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DetailsProductBody extends StatelessWidget {
  const DetailsProductBody({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final wishListCubit = context.watch<WishListCubit>();
    final isFavourite = wishListCubit.isFavourite(product.id);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                      isFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                    onPressed: () {
                      context.read<WishListCubit>().toggleFavourite(product);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              CarouselSlider(
                options: CarouselOptions(height: 350.0),
                items: [product.image].map((image) {
                  return Builder(
                    builder: (context) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.network(image, fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
