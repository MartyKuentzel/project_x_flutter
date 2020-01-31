import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_x_flutter/core/error/exceptions.dart';
import 'package:project_x_flutter/core/error/failures.dart';
//import 'package:project_x_flutter/core/network/network_info.dart';
import 'package:project_x_flutter/data/datasource/product_remote_datasource.dart';
import 'package:project_x_flutter/data/models/product_model.dart';
import 'package:project_x_flutter/data/repositories/product_repository_impl.dart';
import 'package:fixnum/fixnum.dart';
import 'package:project_x_flutter/domain/entities/product.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDatasource {}

//class MockLocalDataSource extends Mock implements ProductLocalDataSource {}

//class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ProductRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
//  MockLocalDataSource mockLocalDataSource;
  // MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    // mockLocalDataSource = MockLocalDataSource();
    // mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      // localDataSource: mockLocalDataSource,
      //  networkInfo: mockNetworkInfo,
    );
  });

  group('getProductDetails', () {
    final tId = Int64(1);
    final tProductModel = ProductModel(
        category: 'bla',
        id: Int64(1),
        unit: 'kg',
        name: 'bla Product',
        creator: 'mkuentzel@web.de',
        price: '5',
        description: 'blabla');

    final Product tProduct = tProductModel;

    test(
        'should return remote data when the call to remote data source is succesfull',
        () async {
      //arange
      when(mockRemoteDataSource.getProductDetails(any))
          .thenAnswer((_) async => tProductModel);
      //act
      final result = await repository.getProductDetails(tId);
      //assert
      verify(mockRemoteDataSource.getProductDetails(tId));
      expect(result, equals(Right(tProduct)));
    });

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getProductDetails(any))
            .thenThrow(ServerException());
        // act
        final result = await repository.getProductDetails(tId);
        // assert
        verify(mockRemoteDataSource.getProductDetails(tId));
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });
}
