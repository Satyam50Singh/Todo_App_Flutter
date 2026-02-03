import '../models/register_response_model/register_response_model.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterResponseModel> register(
    String username,
    String email,
    String password,
    String fullName,
    String mobileNumber,
  );
}
