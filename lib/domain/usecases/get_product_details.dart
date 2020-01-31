import 'package:dartz/dartz.dart';
import 'package:fixnum/fixnum.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductDetails implements UseCaseWithParams<Product, Int64> {
  final ProductRepository repository;

  GetProductDetails(this.repository);

  @override
  Future<Either<Failure, Product>> call(Int64 id) async {
    return await repository.getProductDetails(id);
  }
}
