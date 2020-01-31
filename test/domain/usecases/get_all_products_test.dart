import 'package:dartz/dartz.dart';
import 'package:project_x_flutter/domain/repositories/product_repository.dart';
import 'package:project_x_flutter/domain/usecases/get_all_products.dart';
import '../../fixtures/products.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  GetAllProducts usecase;
  MockProductRepository mockNumberProductRepository;

  setUp(() {
    mockNumberProductRepository = MockProductRepository();
    usecase = GetAllProducts(mockNumberProductRepository);
  });

  test(
    'should get all Products for from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockNumberProductRepository.getAllProducts())
          .thenAnswer((_) async => Right(products));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase();
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(products));
      // Verify that the method has been called on the Repository
      verify(mockNumberProductRepository.getAllProducts());
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberProductRepository);
    },
  );
}
