import 'package:auth_app/features/auth/login/data/datasources/auth_remote_data_source.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:auth_app/features/auth/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponseModel = await _authRemoteDataSource.login(
        email,
        password,
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
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
