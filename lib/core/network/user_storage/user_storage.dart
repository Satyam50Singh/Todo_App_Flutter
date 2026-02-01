abstract class UserStorage {
  Future<String?> getUserId();

  Future<void> saveUserId({required String userId});

  Future<void> clearUserId();
}
