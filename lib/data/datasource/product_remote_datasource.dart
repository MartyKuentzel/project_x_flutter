import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:project_x_flutter/core/error/exceptions.dart';
import 'package:meta/meta.dart';

import 'package:project_x_flutter/core/api/v1/product-service.pbgrpc.dart';
import 'package:project_x_flutter/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<ProductModel> getProductDetails(Int64 id);
  Future<List<ProductModel>> getAllProducts();
  Future<void> createProduct(ProductModel productModel);
  Future<void> updateProduct(ProductModel productModel);
  Future<void> deleteProduct(Int64 id);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final ClientChannel channel;
  static ProductServiceClient client;

  ProductRemoteDatasourceImpl({@required this.channel}) {
    client = ProductServiceClient(
      ClientChannel("10.0.2.2",
          port: 8080,
          options: ChannelOptions(credentials: ChannelCredentials.insecure())),
    );
  }

  @override
  Future<ProductModel> getProductDetails(Int64 id) async {
    try {
      final response = await client.read(new ReadRequest()
        ..api = "v1"
        ..id = id);
      return ProductModel.fromProto(response.product);
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await client.readAll(new ReadAllRequest()..api = "v1");
      return response.products
          .map((product) => ProductModel.fromProto(product))
          .toList();
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<void> createProduct(ProductModel productModel) async {
    try {
      final response = await client.create(new CreateRequest()
        ..api = "v1"
        ..product = productModel.toProto());
      print('Product created with ${response.id}');
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<void> updateProduct(ProductModel productModel) async {
    try {
      final response = await client.update(new UpdateRequest()
        ..api = "v1"
        ..product = productModel.toProto());
      print('Product updated. Response Id: ${response.updated}');
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(Int64 id) async {
    try {
      final response = await client.delete(new DeleteRequest()
        ..api = "v1"
        ..id = id);
      print('Product updated. Response Id: ${response.deleted}');
    } catch (e) {
      print('Caught error: $e');
      throw ServerException();
    }
  }
}

// abstract class ProductRemoteDatasource {
//   Future<ProductModel> getProductDetails(String id);
//   Future<List<ProductModel>> getAllProducts();
//   Future<void> createProduct(ProductModel productModel);
//   Future<void> updateProduct(ProductModel productModel);
//   Future<void> deleteProduct(String id);
// }

// class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
//   final ClientChannel channel;

//   ProductRemoteDatasourceImpl({@required this.channel});

//   @override
//   Future<ProductModel> getProductDetails(String id) async {
//     try {
//       return ProductModel(
//           category: 'bla',
//           id: '123',
//           unit: 'kg',
//           name: 'bla Product',
//           creator: 'mkuentzel@web.de',
//           price: '5',
//           description: 'blabla');
//     } catch (e) {
//       print('Caught error: $e');
//       throw ServerException();
//     }
//   }

//   @override
//   Future<List<ProductModel>> getAllProducts() async {
//     try {
//       return [
//         ProductModel(
//             category: 'bla',
//             id: '123',
//             unit: 'kg',
//             name: 'bla Product',
//             creator: 'mkuentzel@web.de',
//             price: '5',
//             description: 'blabla')
//       ];
//     } catch (e) {
//       print('Caught error: $e');
//       throw ServerException();
//     }
//   }

//   @override
//   Future<void> createProduct(ProductModel productModel) async {
//     try {
//       print('Product created with ');
//     } catch (e) {
//       print('Caught error: $e');
//       throw ServerException();
//     }
//   }

//   @override
//   Future<void> updateProduct(ProductModel productModel) async {
//     try {
//       print('Product updated. Response');
//     } catch (e) {
//       print('Caught error: $e');
//       throw ServerException();
//     }
//   }

//   @override
//   Future<void> deleteProduct(String id) async {
//     try {
//       print('Product updated. Response Id: ');
//     } catch (e) {
//       print('Caught error: $e');
//       throw ServerException();
//     }
//   }
// }
