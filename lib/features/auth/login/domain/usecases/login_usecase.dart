import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:auth_app/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<Failure, LoginEntity>> call({required String email, required String password}) {
    return _authRepository.login(email: email, password: password);
  }
}
