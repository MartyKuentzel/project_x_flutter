import 'package:get_it/get_it.dart';
import 'package:project_x_flutter/data/datasource/product_remote_datasource.dart';
import 'package:project_x_flutter/data/repositories/product_repository_impl.dart';
import 'package:project_x_flutter/domain/repositories/product_repository.dart';
import 'package:project_x_flutter/domain/usecases/create_product.dart';
import 'package:project_x_flutter/domain/usecases/delete_product.dart';
import 'package:project_x_flutter/domain/usecases/get_all_products.dart';
import 'package:project_x_flutter/domain/usecases/get_product_details.dart';
import 'package:project_x_flutter/domain/usecases/update_product.dart';
import 'package:project_x_flutter/presentation/bloc/product/product_bloc.dart';
import 'package:grpc/grpc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => ProductBloc(
      getAll: sl(),
      getOne: sl(),
      update: sl(),
      create: sl(),
      delete: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProductDetails(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(channel: sl()),
  );

  //! External
  sl.registerLazySingleton(() => ClientChannel("10.0.2.2",
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure())));
}
