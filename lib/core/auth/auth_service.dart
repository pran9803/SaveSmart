class AuthService {
  const AuthService();

  Future<bool> authenticate({
    required String username,
    required String password,
  }) async {
    // Temporary local authentication.
    // This will later be replaced by the real backend API.
    return username == '1' && password == '1';
  }
}
