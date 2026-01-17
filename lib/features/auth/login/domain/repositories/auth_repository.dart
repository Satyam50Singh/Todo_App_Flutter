import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<LoginEntity> login({required String email, required String password});

  Future<void> logout();
}
