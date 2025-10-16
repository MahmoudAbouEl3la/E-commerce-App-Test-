import 'package:e_commerce_app_task/features/home/presentation/home_screen.dart';
import 'package:e_commerce_app_task/features/page_view/bottom_nav_bar.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/wish_list_screen.dart';
import 'package:e_commerce_app_task/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentPage = 0;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    setState(() => _currentPage = index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    if (index == 0) {
      context.read<WishListCubit>().getAllWishListData();
    }
  }

  Future<bool> _onWillPop() async {
    if (_currentPage != 0) {
      _onTabSelected(0);
      return false;
    }
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit App"),
        content: const Text("Do you really want to exit the app?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
    return shouldExit ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() => _currentPage = index);
            if (index == 0) {
              context.read<WishListCubit>().getAllWishListData();
            }
          },
          children: const [HomeScreen(), WishListScreen()],
        ),
        bottomNavigationBar: BottomNavBar(
          currentPage: _currentPage,
          onTabSelected: _onTabSelected,
        ),
      ),
    );
  }
}
