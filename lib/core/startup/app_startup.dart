import 'package:auth_app/core/network/token_storage.dart';
import 'package:flutter/material.dart';

class AppStartup {
  final TokenStorage _tokenStorage;

  AppStartup(this._tokenStorage);

  Future<bool> isAuthenticated() async {
    final token = await _tokenStorage.getAccessToken();
    debugPrint('Token: $token');
    return token != null && token.isNotEmpty;
  }
}
