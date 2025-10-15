import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call(Param param);
}
