import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(String email, String password);
}
