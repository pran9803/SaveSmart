import 'package:flutter/foundation.dart';

import 'auth_service.dart';
import 'auth_session_store.dart';
import 'auth_state.dart';

class AuthController extends ChangeNotifier {
  AuthController({AuthSessionStore? sessionStore, AuthService? authService})
    : _sessionStore = sessionStore ?? AuthSessionStore(),
      _authService = authService ?? const AuthService();

  final AuthSessionStore _sessionStore;
  final AuthService _authService;

  AuthState _state = const AuthState.initializing();

  AuthState get state => _state;

  bool get isAuthenticated => _state.isAuthenticated;

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final isValid = await _authService.authenticate(
      username: username,
      password: password,
    );

    if (!isValid) {
      return false;
    }

    await _sessionStore.saveAuthenticated();

    _state = const AuthState.authenticated();
    notifyListeners();

    return true;
  }

  Future<void> logout() async {
    await _sessionStore.clear();

    _state = const AuthState.unauthenticated();
    notifyListeners();
  }

  Future<void> restoreSession() async {
    final isAuthenticated = await _sessionStore.isAuthenticated();

    _state = isAuthenticated
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();

    notifyListeners();
  }
}
