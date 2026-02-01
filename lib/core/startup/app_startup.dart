import 'package:flutter/material.dart';

import '../network/auth_storage/token_storage.dart';

class AppStartup {
  final TokenStorage _tokenStorage;

  AppStartup(this._tokenStorage);

  Future<bool> isAuthenticated() async {
    final token = await _tokenStorage.getAccessToken();
    debugPrint('Token: $token');
    return token != null && token.isNotEmpty;
  }
}
