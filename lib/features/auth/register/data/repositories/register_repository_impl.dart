import 'package:auth_app/core/base/base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_remote_data_source.dart';
import '../models/register_response_model/register_response_model.dart';

class RegisterRepositoryImpl extends BaseRepository
    implements RegisterRepository {
  final RegisterRemoteDataSource _registerRemoteDataSource;

  RegisterRepositoryImpl(this._registerRemoteDataSource);

  @override
  Future<Either<Failure, RegisterEntity>> register({
    required String username,
    required String email,
    required String password,
    required String fullName,
    required String mobileNumber,
  }) {
    return execute(() async {
      final RegisterResponseModel registerResponseModel =
          await _registerRemoteDataSource.register(
            username,
            email,
            password,
            fullName,
            mobileNumber,
          );

      final registerDataModel = registerResponseModel.data;

      return RegisterEntity(
        status: registerResponseModel.status ?? 0,
        message: registerResponseModel.message ?? '',
        errorMsg: registerResponseModel.errorMsg ?? '',
        loginMessage: registerDataModel?.loginMessage ?? '',
      );
    });
  }
}
