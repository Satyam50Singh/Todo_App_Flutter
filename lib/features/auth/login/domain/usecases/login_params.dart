import 'package:auth_app/core/usecase/params.dart';

class LoginParams extends Params {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}
