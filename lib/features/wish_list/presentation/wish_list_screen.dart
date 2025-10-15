import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/core/widgets/custom_loading_indicator.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_state.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/widgets/wish_list_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WishListCubit>().getAllWishListData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          if (state is WishListLoading) {
            return CustomLoadingIndicator();
          } else if (state is WishListError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is WishListSuccess) {
            return WishListBody(products: state.products);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
