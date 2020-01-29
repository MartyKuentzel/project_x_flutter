import 'package:fixnum/fixnum.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> getProductDetails(Int64 id);
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, void>> createProduct(Product product);
  Future<Either<Failure, void>> updateProduct(Product product);
  Future<Either<Failure, void>> deleteProduct(Int64 id);
}
