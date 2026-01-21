import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login({required String email, required String password});

  Future<Either<Failure, void>> logout();
}
