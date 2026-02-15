import 'dart:convert';

import 'package:auth_app/core/network/auth_storage/token_storage.dart';
import 'package:auth_app/core/network/network_constants.dart';
import 'package:auth_app/core/network/services/auth_refresh_service.dart';
import 'package:auth_app/core/storage/StorageKeys.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';

class AuthRefreshServiceImpl implements AuthRefreshService {
  final TokenStorage tokenStorage;
  final http.Client client;

  AuthRefreshServiceImpl(this.tokenStorage, this.client);

  @override
  Future<bool> refreshToken() async {
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) return false;

    final url = Uri.parse(
      '${NetworkConstants.baseTodoWebApiUrl}${NetworkConstants.authRefreshToken}',
    );

    final response = await client.post(
      url,
      headers: {NetworkConstants.contentType: 'application/json'},
      body: jsonEncode({Constants.refreshToken: refreshToken}),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final data = decoded['Data'];
      if (data != null) {
        final newAccessToken = data[StorageKeys.accessToken];
        final newRefreshToken = data[StorageKeys.refreshToken];
        if (newAccessToken != null && newRefreshToken != null) {
          await tokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
          );
        }
      }
      return true;
    }

    return false;
  }
}
