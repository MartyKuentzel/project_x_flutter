import 'package:dartz/dartz.dart';
import 'package:project_x_flutter/core/error/failures.dart';
import 'package:project_x_flutter/core/usecases/usecase.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:project_x_flutter/domain/repositories/product_repository.dart';

class GetAllProducts implements UseCaseWithoutParams<List<Product>> {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
