import 'package:auth_app/core/device/device_id_provider.dart';
import 'package:auth_app/core/device/device_id_provider_impl.dart';
import 'package:auth_app/core/network/auth_storage/secure_token_storage.dart';
import 'package:auth_app/core/network/intercepted_http_client.dart';
import 'package:auth_app/core/network/interceptors/auth_interceptor.dart';
import 'package:auth_app/core/network/network_services_api.dart';
import 'package:auth_app/core/network/user_storage/user_storage_impl.dart';
import 'package:auth_app/core/utils/validations.dart';
import 'package:auth_app/features/auth/login/data/datasources/login_remote_data_source.dart';
import 'package:auth_app/features/auth/login/data/datasources/login_remote_data_source_impl.dart';
import 'package:auth_app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:auth_app/features/auth/login/domain/usecases/logout_use_case.dart';
import 'package:auth_app/features/auth/register/data/datasources/register_remote_data_source.dart';
import 'package:auth_app/features/auth/register/data/datasources/register_remote_data_source_impl.dart';
import 'package:auth_app/features/auth/register/data/repositories/register_repository_impl.dart';
import 'package:auth_app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:auth_app/features/auth/register/domain/usecases/register_usecase.dart';
import 'package:auth_app/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:auth_app/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:auth_app/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:auth_app/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:auth_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/login/data/repositories/login_repository_impl.dart';
import '../../features/auth/login/presentation/bloc/login_bloc.dart';
import '../../features/todo/data/datasources/todo_remote_datasource_impl.dart';
import '../../features/todo/domain/repositories/todo_repository.dart';
import '../network/auth_storage/token_storage.dart';
import '../network/user_storage/user_storage.dart';
import '../startup/app_startup.dart';
import '../storage/secure_storage.dart';
import '../storage/secure_storage_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Secure Storage
  sl.registerLazySingleton<SecureStorage>(
    () => SecureStorageImpl(const FlutterSecureStorage()),
  );

  // Register Storage
  sl.registerLazySingleton<TokenStorage>(() => SecureTokenStorage(sl()));
  sl.registerLazySingleton<UserStorage>(() => UserStorageImpl(sl()));

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
  sl.registerLazySingleton<TodoRemoteDatasource>(
    () => TodoRemoteDatasourceImpl(sl<NetworkServicesApi>()),
  );

  // Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      sl<LoginRemoteDataSource>(),
      sl<TokenStorage>(),
      sl<UserStorage>(),
    ),
  );
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(sl<RegisterRemoteDataSource>()),
  );
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(sl<TodoRemoteDatasource>(), sl<UserStorage>()),
  );

  // Use Cases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));
  sl.registerLazySingleton<AddTodoUseCase>(() => AddTodoUseCase(sl()));

  // Bloc must be factory, not singleton
  sl.registerFactory(
    () =>
        LoginBloc(sl<LoginUseCase>(), sl<LogoutUseCase>(), sl<IValidations>()),
  );
  sl.registerFactory(() => RegisterBloc(sl<RegisterUseCase>()));
  sl.registerFactory(() => TodoBloc(sl<AddTodoUseCase>()));

  // App Startup
  sl.registerLazySingleton<AppStartup>(() => AppStartup(sl()));

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(sl<TokenStorage>(), sl<DeviceIdProvider>()),
  );

  sl.registerLazySingleton<InterceptedHttpClient>(
    () => InterceptedHttpClient(http.Client(), [sl<AuthInterceptor>()]),
  );

  // Validations
  sl.registerLazySingleton<IValidations>(() => Validations());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<DeviceInfoPlugin>(() => DeviceInfoPlugin());

  // Device Id Provider
  sl.registerLazySingleton<DeviceIdProvider>(
    () => DeviceIdProviderImpl(sl(), sl()),
  );
}
