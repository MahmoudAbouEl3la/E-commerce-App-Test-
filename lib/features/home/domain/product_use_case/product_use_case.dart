import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/errors/failure.dart';
import 'package:e_commerce_app_task/core/use_case/use_case.dart';
import 'package:e_commerce_app_task/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_task/features/home/domain/product_repo/product_repo.dart';

class ProductUseCase extends UseCase<List<ProductEntity>, int> {
  final ProductRepo productRepo;

  ProductUseCase({required this.productRepo});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(int page) async {
    return await productRepo.getProducts(page: page);
  }
}
