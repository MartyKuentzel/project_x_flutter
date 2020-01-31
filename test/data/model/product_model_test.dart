import 'package:flutter_test/flutter_test.dart';
import 'package:project_x_flutter/data/models/product_model.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:fixnum/fixnum.dart';

void main() {
  final tProductModel = ProductModel(
      category: 'bla',
      id: Int64(1),
      unit: 'kg',
      name: 'bla Product',
      creator: 'mkuentzel@web.de',
      price: '5',
      description: 'blabla');

  test("should be a subclass of Product Entity", () async {
    expect(tProductModel, isA<Product>());
  });
}
