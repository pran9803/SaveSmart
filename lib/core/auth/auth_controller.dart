import 'package:flutter/foundation.dart';

import 'auth_session_store.dart';
import 'auth_state.dart';

class AuthController extends ChangeNotifier {
  AuthController({AuthSessionStore? sessionStore})
    : _sessionStore = sessionStore ?? AuthSessionStore();

  final AuthSessionStore _sessionStore;

  AuthState _state = const AuthState.initializing();

  AuthState get state => _state;

  bool get isAuthenticated => _state.isAuthenticated;

  Future<void> login() async {
    await _sessionStore.saveAuthenticated();

    _state = const AuthState.authenticated();
    notifyListeners();
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
