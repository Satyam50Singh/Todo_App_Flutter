import 'package:auth_app/core/network/token_storage.dart';
import 'package:auth_app/core/storage/StorageKeys.dart';
import 'package:auth_app/core/storage/secure_storage.dart';

class SecureTokenStorage implements TokenStorage {
  final SecureStorage _secureStorage;

  SecureTokenStorage(this._secureStorage);

  @override
  Future<String?> getAccessToken() {
    return _secureStorage.read(StorageKeys.accessToken);
  }

  @override
  Future<String?> getRefreshToken() {
    // TODO: implement getRefreshToken
    return _secureStorage.read(StorageKeys.refreshToken);
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(StorageKeys.accessToken, accessToken);
    await _secureStorage.write(StorageKeys.refreshToken, refreshToken);
  }

  @override
  Future<void> clearTokens() async {
    await _secureStorage.delete(StorageKeys.accessToken);
    await _secureStorage.delete(StorageKeys.refreshToken);
  }
}
