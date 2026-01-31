import 'dart:convert';

import 'package:auth_app/core/network/base_api_services.dart';
import 'package:auth_app/core/network/network_constants.dart';
import 'package:auth_app/core/utils/constants.dart';
import 'package:auth_app/features/auth/login/data/models/login_api_response/login_api_response.dart';

import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final BaseApiServices _apiServices;

  LoginRemoteDataSourceImpl(this._apiServices);

  @override
  Future<LoginApiResponse> login(String email, String password) async {
    final response = await _apiServices.postApi(
      NetworkConstants.authLogin,
      jsonEncode({Constants.loginId: email, Constants.password: password}),
      NetworkConstants.baseTodoWebApiUrl,
    );

    return LoginApiResponse.fromJson(response);
  }
}
