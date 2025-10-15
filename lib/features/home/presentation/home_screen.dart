import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/home/presentation/cubit/product_cubit.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/home_body_list_view_widget.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/home_product_appbar_widget.dart';
import 'package:e_commerce_app_task/features/home/presentation/widgets/home_product_chips_widget.dart';
import 'package:e_commerce_app_task/features/wish_list/data/repos/wish_list_repo_impl.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:e_commerce_app_task/core/constans/hive_constans.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All Products";
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts(0);
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ProductEntity>(kHiveBoxWishlist);

    return BlocProvider(
      create: (_) =>
          WishListCubit(wishListRepoImpl: WishListRepoImpl(box: box))
            ..getAllWishListData(),
      child: RefreshIndicator(
        onRefresh: () => context.read<ProductCubit>().getProducts(0),
        child: Scaffold(
          appBar: HomeProductAppbarWidget(),
          body: SafeArea(
            child: Column(
              children: [
                HomeProductChipsWidget(
                  onCategorySelected: (category) => setState(() {
                    selectedCategory = category;
                  }),
                ),
                Expanded(
                  child: HomeBodyListViewWidget(
                    selectedCategory: selectedCategory,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
