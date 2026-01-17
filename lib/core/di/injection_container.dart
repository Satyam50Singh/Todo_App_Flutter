import 'package:auth_app/core/network/base_api_services.dart';
import 'package:auth_app/core/network/network_services_api.dart';
import 'package:auth_app/features/auth/login/data/datasources/auth_remote_data_source.dart';
import 'package:auth_app/features/auth/login/data/datasources/auth_remote_data_source_impl.dart';
import 'package:auth_app/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/repositories/auth_repository_impl.dart';
import '../../features/auth/login/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //  LazySingleton = created only when needed
  sl.registerLazySingleton<BaseApiServices>(() => NetworkServicesApi());

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  // Bloc must be factory, not singleton
  sl.registerFactory(() => AuthBloc(sl()));
}
