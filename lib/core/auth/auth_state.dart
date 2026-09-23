enum AuthStatus { unauthenticated, authenticated }

class AuthState {
  final AuthStatus status;

  const AuthState({required this.status});

  const AuthState.unauthenticated() : status = AuthStatus.unauthenticated;

  const AuthState.authenticated() : status = AuthStatus.authenticated;

  bool get isAuthenticated => status == AuthStatus.authenticated;
}
