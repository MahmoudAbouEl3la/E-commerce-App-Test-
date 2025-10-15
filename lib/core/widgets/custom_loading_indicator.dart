import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
        value: 0.5,
        strokeWidth: 2,
        backgroundColor: kGreyColor,
      ),
    );
  }
}
