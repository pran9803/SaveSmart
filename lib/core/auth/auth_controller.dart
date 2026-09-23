import 'package:flutter/foundation.dart';

import 'auth_state.dart';

class AuthController extends ChangeNotifier {
  AuthState _state = const AuthState.unauthenticated();

  AuthState get state => _state;

  bool get isAuthenticated => _state.isAuthenticated;

  void login() {
    _state = const AuthState.authenticated();
    notifyListeners();
  }

  void logout() {
    _state = const AuthState.unauthenticated();
    notifyListeners();
  }
}
