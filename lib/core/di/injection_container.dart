import 'package:auth_app/core/network/intercepted_http_client.dart';
import 'package:auth_app/core/network/interceptors/auth_interceptor.dart';
import 'package:auth_app/core/network/network_services_api.dart';
import 'package:auth_app/core/network/secure_token_storage.dart';
import 'package:auth_app/core/network/token_storage.dart';
import 'package:auth_app/core/storage/secure_storage.dart';
import 'package:auth_app/core/utils/validations.dart';
import 'package:auth_app/features/auth/login/data/datasources/login_remote_data_source.dart';
import 'package:auth_app/features/auth/login/data/datasources/login_remote_data_source_impl.dart';
import 'package:auth_app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:auth_app/features/auth/register/data/datasources/register_remote_data_source.dart';
import 'package:auth_app/features/auth/register/data/datasources/register_remote_data_source_impl.dart';
import 'package:auth_app/features/auth/register/data/repositories/register_repository_impl.dart';
import 'package:auth_app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:auth_app/features/auth/register/domain/usecases/register_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../features/auth/login/data/repositories/login_repository_impl.dart';
import '../../features/auth/login/presentation/bloc/auth_bloc.dart';
import '../startup/app_startup.dart';
import '../storage/secure_storage_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Secure Storage
  sl.registerLazySingleton<SecureStorage>(
    () => SecureStorageImpl(const FlutterSecureStorage()),
  );

  // Register Token Storage
  sl.registerLazySingleton<TokenStorage>(() => SecureTokenStorage(sl()));

  // Register Network Layer
  sl.registerLazySingleton<NetworkServicesApi>(
    () => NetworkServicesApi(sl<TokenStorage>(), sl<InterceptedHttpClient>()),
  );

  // Remote Data Sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(sl<NetworkServicesApi>()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(sl<NetworkServicesApi>()),
  );

  // Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(sl<LoginRemoteDataSource>(), sl<TokenStorage>()),
  );
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(sl<RegisterRemoteDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));

  // Bloc must be factory, not singleton
  sl.registerFactory(
    () =>
        AuthBloc(sl<LoginUseCase>(), sl<RegisterUseCase>(), sl<IValidations>()),
  );

  // App Startup
  sl.registerLazySingleton<AppStartup>(() => AppStartup(sl()));

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(sl<TokenStorage>()),
  );

  sl.registerLazySingleton<InterceptedHttpClient>(
    () => InterceptedHttpClient(http.Client(), [sl<AuthInterceptor>()]),
  );

  // Validations
  sl.registerLazySingleton<IValidations>(() => Validations());
}
