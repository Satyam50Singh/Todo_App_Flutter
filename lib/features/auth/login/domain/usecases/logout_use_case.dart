import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/core/usecase/base_usecase.dart';
import 'package:auth_app/core/usecase/params.dart';
import 'package:dartz/dartz.dart';

import '../repositories/login_repository.dart';

class LogoutUseCase implements BaseUseCase<void, NoParams> {
  final LoginRepository _loginRepository;

  LogoutUseCase(this._loginRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _loginRepository.logout();
  }
}
