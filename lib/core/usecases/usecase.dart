import 'package:fixnum/fixnum.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project_x_flutter/domain/entities/product.dart';

import '../error/failures.dart';
import 'package:meta/meta.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final Int64 id;

  Params({@required this.id});

  @override
  List<Object> get props => [id];
}

class ProductParams extends Equatable {
  final Product product;

  ProductParams({@required this.product});

  @override
  List<Object> get props => [product];
}
