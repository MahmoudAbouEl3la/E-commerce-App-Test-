import 'package:e_commerce_app_task/features/auth/login/domain/entities/user_entities.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;
  LoginError({required this.errorMessage});
}

class LoginSuccess extends LoginState {
  final UserEntity userEntity;
  LoginSuccess({required this.userEntity});
}
