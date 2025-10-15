import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/features/auth/login/data/data_source/remote_data_source/login_remote_data_source.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/entities/user_entities.dart';
import 'package:e_commerce_app_task/features/auth/login/domain/login_repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepoImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      final respone = await loginRemoteDataSource.login(username, password);
      return Right(respone);
    } on DioException catch (error) {
      return Left(ServerFailures.fromDioError(error));
    } catch (error) {
      return Left(ServerFailures(message: error.toString()));
    }
  }
}
