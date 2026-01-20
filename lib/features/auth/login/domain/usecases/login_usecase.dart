import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/core/usecase/base_usecase.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:auth_app/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import 'login_params.dart';

class LoginUseCase implements BaseUseCase<LoginEntity, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) {
    return _authRepository.login(
      email: params.username,
      password: params.password,
    );
  }
}
