import 'package:e_commerce_app_task/features/auth/login/presentation/widgets/login_form_widget.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/widgets/login_image_and_title_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.15),
                LoginImageAndTitleWidget(size: size),
                SizedBox(height: size.height * 0.03),
                const LoginFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
