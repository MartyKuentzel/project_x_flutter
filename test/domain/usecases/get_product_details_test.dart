import 'package:dartz/dartz.dart';
import 'package:project_x_flutter/domain/repositories/product_repository.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:project_x_flutter/domain/usecases/get_product_details.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fixnum/fixnum.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  GetProductDetails usecase;
  MockProductRepository mockNumberProductRepository;

  setUp(() {
    mockNumberProductRepository = MockProductRepository();
    usecase = GetProductDetails(mockNumberProductRepository);
  });

  final tId = Int64(1);
  final tProduct = Product(
      category: 'bla',
      id: Int64(1),
      unit: 'kg',
      name: 'bla Product',
      creator: 'mkuentzel@web.de',
      price: '5',
      description: 'blabla');

  test(
    'should get Product for the id from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockNumberProductRepository.getProductDetails(any))
          .thenAnswer((_) async => Right(tProduct));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(tId);
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tProduct));
      // Verify that the method has been called on the Repository
      verify(mockNumberProductRepository.getProductDetails(tId));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberProductRepository);
    },
  );
}
