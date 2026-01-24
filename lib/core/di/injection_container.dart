import 'package:auth_app/core/network/intercepted_http_client.dart';
import 'package:auth_app/core/network/interceptors/auth_interceptor.dart';
import 'package:auth_app/core/network/network_services_api.dart';
import 'package:auth_app/core/network/secure_token_storage.dart';
import 'package:auth_app/core/network/token_storage.dart';
import 'package:auth_app/core/storage/secure_storage.dart';
import 'package:auth_app/features/auth/login/data/datasources/auth_remote_data_source.dart';
import 'package:auth_app/features/auth/login/data/datasources/auth_remote_data_source_impl.dart';
import 'package:auth_app/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../features/auth/login/data/repositories/auth_repository_impl.dart';
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

  // Register Auth Feature
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<NetworkServicesApi>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>(), sl<TokenStorage>()),
  );

  // Use Cases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  // Bloc must be factory, not singleton
  sl.registerFactory(() => AuthBloc(sl()));

  // App Startup
  sl.registerLazySingleton<AppStartup>(() => AppStartup(sl()));

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(sl<TokenStorage>()),
  );

  sl.registerLazySingleton<InterceptedHttpClient>(
    () => InterceptedHttpClient(http.Client(), [sl<AuthInterceptor>()]),
  );
}
