import 'package:auth_app/core/network/user_storage/user_storage.dart';

import '../../storage/StorageKeys.dart';
import '../../storage/secure_storage.dart';

class UserStorageImpl implements UserStorage {
  final SecureStorage _secureStorage;

  UserStorageImpl(this._secureStorage);

  @override
  Future<void> clearUserId() {
    return _secureStorage.delete(StorageKeys.userId);
  }

  @override
  Future<String?> getUserId() {
    return _secureStorage.read(StorageKeys.userId);
  }

  @override
  Future<void> saveUserId({required String userId}) {
    return _secureStorage.write(StorageKeys.userId, userId);
  }
}
