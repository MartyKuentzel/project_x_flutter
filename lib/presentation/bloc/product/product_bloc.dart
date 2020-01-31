import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:project_x_flutter/core/error/failures.dart';
import 'package:project_x_flutter/core/usecases/usecase.dart';
import 'package:project_x_flutter/domain/entities/product.dart';
import 'package:project_x_flutter/domain/usecases/create_product.dart';
import 'package:project_x_flutter/domain/usecases/delete_product.dart';
import 'package:project_x_flutter/domain/usecases/get_all_products.dart';
import 'package:project_x_flutter/domain/usecases/get_product_details.dart';
import 'package:project_x_flutter/domain/usecases/update_product.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  final GetProductDetails getProductDetails;
  final UpdateProduct updateProduct;
  final CreateProduct createProduct;
  final DeleteProduct deleteProduct;

  ProductBloc({
    @required GetAllProducts getAll,
    @required GetProductDetails getOne,
    @required UpdateProduct update,
    @required CreateProduct create,
    @required DeleteProduct delete,
  })  : assert(getAll != null),
        assert(getOne != null),
        assert(update != null),
        assert(create != null),
        assert(delete != null),
        getAllProducts = getAll,
        getProductDetails = getOne,
        updateProduct = update,
        createProduct = create,
        deleteProduct = delete;

  @override
  ProductState get initialState => Empty();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetAllProductEntries) {
      yield Loading();
      final failureOrProduct = await getAllProducts();
      yield failureOrProduct.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (products) => LoadedProducts(products: products),
      );
    } else if (event is GetOneProductEntry) {
      yield Loading();
      final failureOrProduct = await getProductDetails(event.id);
      yield* _eitherLoadedOrErrorState(failureOrProduct);
    } else if (event is DeleteProductEntry) {
      yield Loading();
      final failureOrProduct = await deleteProduct(event.id);
      yield* _eitherLoadedOrErrorState(failureOrProduct);
    } else if (event is UpdateProductEntry) {
      yield Loading();
      final failureOrProduct = await updateProduct(event.product);
      yield* _eitherLoadedOrErrorState(failureOrProduct);
    } else if (event is CreateProductEntry) {
      yield Loading();
      final failureOrProduct = await createProduct(event.product);

      yield failureOrProduct.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (success) => ProductCreated(),
      );
    }
  }

  Stream<ProductState> _eitherLoadedOrErrorState(
    Either<Failure, Product> failureOrProduct,
  ) async* {
    yield failureOrProduct.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (product) => Loaded(product: product),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
