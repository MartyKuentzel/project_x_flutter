import 'package:fixnum/fixnum.dart';

import 'package:project_x_flutter/core/error/exceptions.dart';
import 'package:project_x_flutter/data/datasource/product_remote_datasource.dart';
import 'package:project_x_flutter/data/models/product_model.dart';
import 'package:project_x_flutter/fixtures/products.dart';

class ProductFakeRemoteDatasourceImpl implements ProductRemoteDatasource {
  @override
  Future<ProductModel> getProductDetails(Int64 id) async {
    try {
      return ProductModel(
          category: 'bla',
          id: id,
          unit: 'kg',
          name: 'bla Product',
          creator: 'mkuentzel@web.de',
          price: '5',
          description: 'blabla');
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      return products;
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<void> createProduct(ProductModel productModel) async {
    try {
      print('Product created with ');
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<void> updateProduct(ProductModel productModel) async {
    try {
      print('Product updated. Response');
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(Int64 id) async {
    try {
      print('Product updated. Response Id: ');
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }
}
