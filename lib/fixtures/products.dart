import 'dart:ffi';

import 'package:project_x_flutter/data/models/product_model.dart';
import 'package:fixnum/fixnum.dart';

final products = Future.value(<ProductModel>[
  ProductModel(
      name: 'Potato',
      category: 'vegetable',
      id: Int64(1),
      unit: 'kg',
      creator: 'mkuentzel@web.de',
      price: '2.50',
      description: 'Frisch geerntete Kartoffeln von Bauer Marty'),
  ProductModel(
      name: 'Pork',
      id: Int64(2),
      category: 'Meat',
      unit: 'kg',
      creator: 'mkuentzel@web.de',
      price: '4',
      description: 'Frisches Hackfleisch von Fleischer Marty'),
  ProductModel(
      name: 'Milk',
      id: Int64(3),
      category: 'milk',
      unit: 'l',
      creator: 'mkuentzel@web.de',
      price: '1',
      description: 'Frisch gemolkene Milch von Milchbauer Marty'),
  ProductModel(
      category: 'bla',
      id: Int64(4),
      unit: 'kg',
      name: 'bla Product',
      creator: 'mkuentzel@web.de',
      price: '5',
      description: 'blabla'),
]);
