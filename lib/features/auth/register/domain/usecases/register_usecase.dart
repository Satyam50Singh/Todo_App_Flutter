import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/core/usecase/base_usecase.dart';
import 'package:auth_app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:auth_app/features/auth/register/domain/usecases/register_params.dart';
import 'package:dartz/dartz.dart';

import '../entities/register_entity.dart';

class RegisterUseCase implements BaseUseCase<RegisterEntity, RegisterParams> {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  @override
  Future<Either<Failure, RegisterEntity>> call(RegisterParams params) {
    return _registerRepository.register(
      username: params.username,
      email: params.email,
      password: params.password,
      fullName: params.fullName,
      mobileNumber: params.mobileNumber,
    );
  }
}
