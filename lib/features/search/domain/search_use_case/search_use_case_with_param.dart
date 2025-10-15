import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';

abstract class SearchUseCaseWithParam<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
