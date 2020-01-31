import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';
import 'package:fixnum/fixnum.dart';

class DeleteProduct implements UseCaseWithParams<void, Int64> {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(Int64 id) async {
    return await repository.deleteProduct(id);
  }
}
