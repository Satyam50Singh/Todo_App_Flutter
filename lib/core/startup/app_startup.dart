class AppStartup {
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
