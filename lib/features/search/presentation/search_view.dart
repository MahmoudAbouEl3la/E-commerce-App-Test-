import 'package:e_commerce_app_task/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(body: SearchViewBody()),
    );
  }
}
