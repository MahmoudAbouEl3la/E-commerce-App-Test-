import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/entities/user_entities.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  });
}
