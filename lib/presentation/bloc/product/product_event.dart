import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:fixnum/fixnum.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllProductEntries extends ProductEvent {}

class GetOneProductEntry extends ProductEvent {
  final Int64 id;

  GetOneProductEntry(this.id);

  @override
  List<Object> get props => [id];
}

class DeleteProductEntry extends ProductEvent {
  final Int64 id;

  DeleteProductEntry(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateProductEntry extends ProductEvent {
  final Product product;

  UpdateProductEntry(this.product);

  @override
  List<Object> get props => [product];
}

class CreateProductEntry extends ProductEvent {
  final Product product;

  CreateProductEntry(this.product);

  @override
  List<Object> get props => [product];
}
