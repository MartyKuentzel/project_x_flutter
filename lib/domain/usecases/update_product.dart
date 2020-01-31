import 'package:dartz/dartz.dart';
import 'package:project_x_flutter/core/error/failures.dart';
import 'package:project_x_flutter/core/usecases/usecase.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:project_x_flutter/domain/repositories/product_repository.dart';

class UpdateProduct implements UseCaseWithParams<void, Product> {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, void>> call(Product product) async {
    return await repository.updateProduct(product);
  }
}
