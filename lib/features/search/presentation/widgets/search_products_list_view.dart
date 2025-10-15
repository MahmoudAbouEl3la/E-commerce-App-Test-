import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/search/domain/manager/cubit/search_products_cubit.dart';
import 'package:e_commerce_app_task/features/search/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsListView extends StatefulWidget {
  const SearchProductsListView({
    super.key,
    required this.products,
    this.showLoadingIndicatorAtEnd = false,
  });

  final List<ProductEntity> products;
  final bool showLoadingIndicatorAtEnd;

  @override
  State<SearchProductsListView> createState() => _SearchProductsListViewState();
}

class _SearchProductsListViewState extends State<SearchProductsListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  final int triggerPercent = 70;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> onScroll() async {
    if (!scrollController.hasClients) return;

    final maxScrollLength = scrollController.position.maxScrollExtent;
    if (maxScrollLength <= 0) return;

    final currentPosition = scrollController.position.pixels;
    final distance = (currentPosition / maxScrollLength) * 100;

    if (distance >= triggerPercent && !isLoading) {
      isLoading = true;
      await context.read<SearchProductsCubit>().fetchSearchProducts(
        page: nextPage++,
        query: context.read<SearchProductsCubit>().currentQuery,
      );
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:
            widget.products.length + (widget.showLoadingIndicatorAtEnd ? 1 : 0),
        itemBuilder: (context, index) {
          if (widget.showLoadingIndicatorAtEnd &&
              index == widget.products.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: CustomListViewItem(productEntity: widget.products[index]),
          );
        },
      ),
    );
  }
}
