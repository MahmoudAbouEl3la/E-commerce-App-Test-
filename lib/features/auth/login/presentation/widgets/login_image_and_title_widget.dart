import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:flutter/material.dart';

class LoginImageAndTitleWidget extends StatelessWidget {
  const LoginImageAndTitleWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/login.png", height: size.height * 0.25),
          Text(
            "Sign in to continue",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
