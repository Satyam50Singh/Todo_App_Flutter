import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> login(String email, String password);
}
