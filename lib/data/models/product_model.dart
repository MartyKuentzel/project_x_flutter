import 'package:project_x_flutter/core/api/v1/product-service.pb.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:meta/meta.dart';
import 'package:fixnum/fixnum.dart';

class ProductModel extends Product {
  ProductModel(
      {@required String category,
      @required Int64 id,
      @required String unit,
      @required String name,
      @required String price,
      @required String creator,
      @required String description})
      : super(
            category: category,
            id: id,
            unit: unit,
            name: name,
            price: price,
            creator: creator,
            description: description);

  factory ProductModel.fromProto(ProductProto proto) {
    return ProductModel(
      category: proto.category,
      id: proto.id,
      unit: proto.unit,
      name: proto.name,
      price: proto.price,
      creator: proto.creator,
      description: proto.description,
    );
  }

  ProductProto toProto() {
    return ProductProto()
      ..category = category
      ..id = id
      ..unit = unit
      ..name = name
      ..price = price
      ..creator = creator
      ..description = description;
  }
}
