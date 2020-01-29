import 'package:dartz/dartz.dart';
import 'package:project_x_flutter/core/error/exceptions.dart';
import 'package:project_x_flutter/core/error/failures.dart';
//import 'package:project_x_flutter/core/network/network_info.dart';
import 'package:project_x_flutter/data/datasource/product_remote_datasource.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:project_x_flutter/domain/repositories/product_repository.dart';
import 'package:meta/meta.dart';
import 'package:fixnum/fixnum.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDataSource;
  // final ProductLocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    @required this.remoteDataSource,
    //   @required this.localDataSource,
    //  @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getAllProducts();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails(Int64 id) async {
    try {
      final remoteProduct = await remoteDataSource.getProductDetails(id);
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createProduct(Product product) async {
    try {
      await remoteDataSource.createProduct(product);
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(Int64 id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    try {
      await remoteDataSource.updateProduct(product);
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
