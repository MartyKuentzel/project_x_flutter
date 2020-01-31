import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_x_flutter/domain/entities/product.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductState {}

class Loading extends ProductState {}

class ProductCreated extends ProductState {}

class Loaded extends ProductState {
  final Product product;

  Loaded({@required this.product});

  @override
  List<Object> get props => [product];
}

class LoadedProducts extends ProductState {
  final List<Product> products;

  LoadedProducts({@required this.products});

  @override
  List<Object> get props => [products];
}

class Error extends ProductState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
