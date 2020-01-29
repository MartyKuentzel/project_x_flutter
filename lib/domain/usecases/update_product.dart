import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project_x_flutter/core/error/failures.dart';
import 'package:project_x_flutter/core/usecases/usecase.dart';
import 'package:project_x_flutter/domain/repositories/product_repository.dart';

class UpdateProduct implements UseCase<void, ProductParams> {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, void>> call(ProductParams params) async {
    return await repository.updateProduct(params.product);
  }
}
