import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/core/utilies/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HomeProductAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeProductAppbarWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        title: Text(
          "Products",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push(Routes.searchScreen);
            },
            icon: Icon(Iconsax.search_normal_14, color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
