import '../models/login_api_response/login_api_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginApiResponse> login(String email, String password);
}
