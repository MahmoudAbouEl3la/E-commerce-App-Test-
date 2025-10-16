import 'package:e_commerce_app_task/features/page_view/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentPage,
    required this.onTabSelected,
  });

  final int currentPage;
  final Function(int) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              icon: Iconsax.card,
              label: "Products",
              index: 0,
              currentPage: currentPage,
              onTap: onTabSelected,
            ),
            NavItem(
              icon: Iconsax.heart,
              label: "Wishlist",
              index: 1,
              currentPage: currentPage,
              onTap: onTabSelected,
            ),
          ],
        ),
      ),
    );
  }
}
