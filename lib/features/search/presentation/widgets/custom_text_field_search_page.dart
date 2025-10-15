import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:e_commerce_app_task/features/search/domain/manager/cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFieldSearchPage extends StatefulWidget {
  const CustomTextFieldSearchPage({super.key});

  @override
  State<CustomTextFieldSearchPage> createState() =>
      _CustomTextFieldSearchPageState();
}

class _CustomTextFieldSearchPageState extends State<CustomTextFieldSearchPage> {
  final TextEditingController textEditingController = TextEditingController();
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      final query = textEditingController.text.trim();
      setState(() {});

      if (query.isNotEmpty) {
        context.read<SearchProductsCubit>().fetchSearchProducts(query: query);
      } else {
        context.read<SearchProductsCubit>().resetSearch();
      }
    });
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kPrimaryColor, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = textEditingController.text.trim();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        focusNode: focusNode,
        style: TextStyle(fontSize: 14, color: kPrimaryColor),
        controller: textEditingController,
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            context.read<SearchProductsCubit>().fetchSearchProducts(
              query: value.trim(),
            );
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: kWhiteColor,
          enabledBorder: _borderStyle(),
          focusedBorder: _borderStyle(),
          disabledBorder: _borderStyle(),
          hintText: 'Search Products',
          hintStyle: TextStyle(fontSize: 14, color: kPrimaryColor),
          suffixIcon: query.isNotEmpty
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        textEditingController.clear();
                        context.read<SearchProductsCubit>().resetSearch();
                      },
                      child: Icon(
                        Icons.clear_rounded,
                        color: kPrimaryColor,
                        size: 18,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.search_rounded, color: kPrimaryColor),
                      onPressed: () {
                        if (query.isNotEmpty) {
                          context
                              .read<SearchProductsCubit>()
                              .fetchSearchProducts(query: query);
                        } else {
                          context.read<SearchProductsCubit>().resetSearch();
                        }
                      },
                    ),
                  ],
                )
              : IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search_rounded, color: kPrimaryColor),
                  onPressed: () {
                    if (query.isNotEmpty) {
                      context.read<SearchProductsCubit>().fetchSearchProducts(
                        query: query,
                      );
                    } else {
                      context.read<SearchProductsCubit>().resetSearch();
                    }
                  },
                ),
        ),
      ),
    );
  }
}
