import 'dart:convert';

import 'package:auth_app/features/auth/register/data/datasources/register_remote_data_source.dart';
import 'package:auth_app/features/auth/register/data/models/register/register_response_model.dart';

import '../../../../../core/network/base_api_services.dart';
import '../../../../../core/network/network_constants.dart';
import '../../../../../core/utils/constants.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final BaseApiServices _apiServices;

  RegisterRemoteDataSourceImpl(this._apiServices);

  @override
  Future<RegisterResponseModel> register(
    String username,
    String email,
    String password,
    String fullName,
    String mobileNumber,
  ) async {
    final response = await _apiServices.postApi(
      NetworkConstants.authRegister,
      jsonEncode({
        Constants.username: username,
        Constants.email: email,
        Constants.password: password,
        Constants.fullName: fullName,
        Constants.mobileNumber: mobileNumber,
      }),
      NetworkConstants.baseTodoWebApiUrl,
    );

    return RegisterResponseModel.fromJson(response);
  }
}
