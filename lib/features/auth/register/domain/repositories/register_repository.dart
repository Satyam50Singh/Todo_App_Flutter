import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../entities/register_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterEntity>> register({
    required String username,
    required String email,
    required String password,
    required String fullName,
    required String mobileNumber,
  });
}