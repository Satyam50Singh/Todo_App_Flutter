import 'package:auth_app/features/auth/login/data/datasources/auth_remote_data_source.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:auth_app/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponseModel = await _authRemoteDataSource.login(
        email,
        password,
      );

      return Right(
        LoginEntity(
          id: loginResponseModel.id,
          email: loginResponseModel.email,
          username: loginResponseModel.username,
          firstName: loginResponseModel.firstName,
          lastName: loginResponseModel.lastName,
          gender: loginResponseModel.gender,
          image: loginResponseModel.image,
          accessToken: loginResponseModel.accessToken,
          refreshToken: loginResponseModel.refreshToken,
        ),
      );
    } on NoInternetException catch (e) {
      return Left(e);
    } on BadRequestException catch (e) {
      return Left(e);
    } on UnauthorizedException catch (e) {
      return Left(e);
    } on ForbiddenException catch (e) {
      return Left(e);
    } on NotFoundException catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(e);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(ServerException('Unknown error'));
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
