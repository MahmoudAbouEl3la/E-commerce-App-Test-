import 'package:e_commerce_app_task/core/utilies/routes.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/cubit/login_state.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/widgets/custom_auth_button.dart';
import 'package:e_commerce_app_task/features/auth/login/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController, passwordController;
  late final FocusNode emailFocusNode, passwordFocusNode;
  bool isPassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushReplacement(Routes.layoutScreen);
        } else if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                label: const Text("User Name"),
                focusNode: emailFocusNode,
                nextFocusNode: passwordFocusNode,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
                textInputAction: TextInputAction.next,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your email' : null,
                prefixIcon: const Icon(Iconsax.direct),
                controller: emailController,
              ),
              SizedBox(height: size.height * 0.03),
              CustomTextFormField(
                label: const Text("Password"),
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  child: isPassword
                      ? const Icon(Iconsax.eye)
                      : const Icon(Iconsax.eye_slash),
                ),
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                focusNode: passwordFocusNode,
                obscureText: isPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                      username: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              CustomAuthButton(
                title: state is LoginLoading ? "Loading..." : "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    state is LoginLoading
                        ? null
                        : context.read<LoginCubit>().login(
                            username: emailController.text,
                            password: passwordController.text,
                          );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
