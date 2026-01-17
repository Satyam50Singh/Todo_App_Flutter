import 'dart:convert';

import 'package:auth_app/core/network/base_api_services.dart';
import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final BaseApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final response = await _apiServices.postApi(
      'https://dummyjson.com/auth/login',
      jsonEncode({'username': email, 'password': password}),
    );

    return LoginResponseModel.fromJson(response);
  }
}
