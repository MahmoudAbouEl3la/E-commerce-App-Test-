import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void goTo(String routeName) => GoRouter.of(this).go(routeName);

  void pushTo(String routeName) => GoRouter.of(this).push(routeName);

  void pushReplacementTo(String routeName) =>
      GoRouter.of(this).pushReplacement(routeName);

  void back() => GoRouter.of(this).pop();

  bool canPop() => Navigator.of(this).canPop();
}
