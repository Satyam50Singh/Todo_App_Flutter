import 'dart:convert';

import 'package:auth_app/core/network/base_api_services.dart';
import 'package:auth_app/core/network/network_constants.dart';
import 'package:auth_app/core/utils/constants.dart';
import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final BaseApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final response = await _apiServices.postApi(
      NetworkConstants.authLogin,
      jsonEncode({Constants.username: email, Constants.password: password}),
    );

    return LoginResponseModel.fromJson(response);
  }
}
