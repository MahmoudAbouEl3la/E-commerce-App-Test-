import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/core/use_case/use_case.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/entities/user_entities.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/login_repo/login_repo.dart';
import 'login_params.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) {
    return loginRepo.login(
      username: params.username,
      password: params.password,
    );
  }
}
