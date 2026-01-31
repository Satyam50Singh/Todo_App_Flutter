import 'package:auth_app/core/base/base_repository.dart';
import 'package:auth_app/core/network/token_storage.dart';
import 'package:auth_app/features/auth/login/data/datasources/login_remote_data_source.dart';
import 'package:auth_app/features/auth/login/data/mappers/login_data_mapper.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:auth_app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';

class LoginRepositoryImpl extends BaseRepository implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  final TokenStorage _storage;

  LoginRepositoryImpl(this._loginRemoteDataSource, this._storage);

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    return execute(() async {
      final response = await _loginRemoteDataSource.login(email, password);

      final data = response.data;

      if (data == null) {
        throw ServerException('Login data missing');
      }

      await _storage.saveTokens(
        accessToken: data.accessToken,
        refreshToken: data.refreshToken,
      );

      return data.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _storage.clearTokens();
      return const Right(null);
    } catch (e) {
      return Left(CacheException(e.toString()));
    }
  }
}
