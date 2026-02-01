import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';
import 'package:auth_app/features/auth/login/domain/entities/login_entity.dart';

extension LoginDataMapper on LoginResponseModel {
  LoginEntity toEntity() {
    return LoginEntity(
      id: id,
      email: email,
      username: username,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      image: image,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
