import 'package:auth_app/core/base/base_repository.dart';
import 'package:auth_app/core/network/token_storage.dart';
import 'package:auth_app/features/auth/login/data/datasources/auth_remote_data_source.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:auth_app/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final TokenStorage _storage;

  AuthRepositoryImpl(this._authRemoteDataSource, this._storage);

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    return execute(() async {
      final loginResponseModel = await _authRemoteDataSource.login(
        email,
        password,
      );

      await _storage.saveTokens(
        accessToken: loginResponseModel.accessToken,
        refreshToken: loginResponseModel.refreshToken,
      );

      return LoginEntity(
        id: loginResponseModel.id,
        email: loginResponseModel.email,
        username: loginResponseModel.username,
        firstName: loginResponseModel.firstName,
        lastName: loginResponseModel.lastName,
        gender: loginResponseModel.gender,
        image: loginResponseModel.image,
        accessToken: loginResponseModel.accessToken,
        refreshToken: loginResponseModel.refreshToken,
      );
    });
  }

  @override
  Future<Either<Failure, void>> logout() async {
    await _storage.clearTokens();
    return const Right(null);
  }
}
