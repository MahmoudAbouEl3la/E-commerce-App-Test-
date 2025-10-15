import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
  });
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor ?? kWhiteColor,
          padding: EdgeInsets.all(16),
          backgroundColor: backgroundColor ?? kPrimaryColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: borderColor ?? kPrimaryColor, width: .4),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
