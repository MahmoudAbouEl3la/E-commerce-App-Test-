import 'package:e_commerce_app_task/core/constans/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.obscureText,
    required this.controller,
    this.suffixIcon,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.keyboardType,
    this.focusNode,
    this.nextFocusNode,
  });
  final Widget? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      textInputAction: nextFocusNode != null
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      focusNode: focusNode,

      decoration: InputDecoration(
        label: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.all(14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: kSecondaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
