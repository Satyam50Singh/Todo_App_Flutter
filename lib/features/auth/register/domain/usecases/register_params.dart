import 'package:auth_app/core/usecase/params.dart';

class RegisterParams extends Params {
  final String username;
  final String email;
  final String password;
  final String fullName;
  final String mobileNumber;

  RegisterParams({
    required this.username,
    required this.email,
    required this.password,
    required this.fullName,
    required this.mobileNumber,
  });
}
