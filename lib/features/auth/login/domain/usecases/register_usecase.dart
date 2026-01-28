import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/core/usecase/base_usecase.dart';
import 'package:auth_app/features/auth/login/domain/usecases/register_params.dart';
import 'package:dartz/dartz.dart';

import '../entities/register_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase implements BaseUseCase<RegisterEntity, RegisterParams> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  @override
  Future<Either<Failure, RegisterEntity>> call(RegisterParams params) {
    return _authRepository.register(
      username: params.username,
      email: params.email,
      password: params.password,
      fullName: params.fullName,
      mobileNumber: params.mobileNumber
    );
  }
}
