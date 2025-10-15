import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/core/widgets/custom_loading_indicator.dart';
import 'package:e_commerce_app_task/features/home/presentation/cubit/product_cubit.dart';
import 'package:e_commerce_app_task/features/home/presentation/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductChipsWidget extends StatefulWidget {
  final Function(String) onCategorySelected;

  const HomeProductChipsWidget({super.key, required this.onCategorySelected});

  @override
  State<HomeProductChipsWidget> createState() => _HomeProductChipsWidgetState();
}

class _HomeProductChipsWidgetState extends State<HomeProductChipsWidget> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return CustomLoadingIndicator();
          } else if (state is ProductError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is ProductSuccess) {
            final products = state.products;
            final categories = products
                .map((product) => product.category)
                .toList()
                .toSet()
                .toList();
            categories.insert(0, "All Products");
            return ListView.builder(
              padding: EdgeInsets.only(bottom: size.height * 0.02),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                      widget.onCategorySelected(categories[index]);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Chip(
                      label: Text(
                        categories[index],
                        style: TextStyle(
                          color: index == selectedCategory
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      backgroundColor: index == selectedCategory
                          ? kPrimaryColor
                          : Colors.white,
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
