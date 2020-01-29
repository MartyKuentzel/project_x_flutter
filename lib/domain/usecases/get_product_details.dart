import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductDetails implements UseCase<Product, Params> {
  final ProductRepository repository;

  GetProductDetails(this.repository);

  @override
  Future<Either<Failure, Product>> call(Params params) async {
    return await repository.getProductDetails(params.id);
  }
}
