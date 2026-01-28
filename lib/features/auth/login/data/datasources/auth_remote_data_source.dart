import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';

import '../models/register/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(String email, String password);

  Future<RegisterResponseModel> register(
    String username,
    String email,
    String password,
    String fullName,
    String mobileNumber,
  );
}
