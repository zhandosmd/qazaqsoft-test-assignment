
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qazaqsoft_test_assignment/feature/users/domain/repositories/users_repositories.dart';
import 'package:qazaqsoft_test_assignment/feature/users/presentation/bloc/users_bloc.dart';

import 'core/network/network_info.dart';
import 'feature/users/data/datasources/users_remote_data_source.dart';
import 'feature/users/data/repositories/users_repository_impl.dart';
import 'feature/users/domain/usecases/get_user_contacts.dart';

final sl = GetIt.instance; // service locator

void init() {
  // !Features - Number Trivia
  // bloc
  sl.registerFactory(() => UsersBloc(
    // always obtain new instance on every call
    getConcreteNumberTrivia: sl(),
  ));
  // usecases
  sl.registerLazySingleton(() => GetUserContacts(
    sl())
  ); // same instance, lazy - only regirters when used
  // Repository
  sl.registerLazySingleton<UsersRepository>(
        () => UsersRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<UsersRemoteDataSource>(
      () => UsersRemoteDataSourceImpl(client: sl()),
  );
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
