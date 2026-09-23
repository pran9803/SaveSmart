import 'package:flutter_test/flutter_test.dart';
import 'package:save_smart/core/auth/auth_controller.dart';
import 'package:save_smart/core/auth/auth_session_store.dart';

class FakeAuthSessionStore implements AuthSessionStore {
  bool authenticated = false;

  @override
  Future<bool> isAuthenticated() async {
    return authenticated;
  }

  @override
  Future<void> saveAuthenticated() async {
    authenticated = true;
  }

  @override
  Future<void> clear() async {
    authenticated = false;
  }
}

void main() {
  group('AuthController', () {
    test('starts in initializing state', () {
      final store = FakeAuthSessionStore();
      final controller = AuthController(sessionStore: store);

      expect(controller.state.isInitializing, isTrue);
      expect(controller.isAuthenticated, isFalse);
    });

    test('login authenticates and saves the session', () async {
      final store = FakeAuthSessionStore();
      final controller = AuthController(sessionStore: store);

      await controller.login();

      expect(controller.isAuthenticated, isTrue);
      expect(store.authenticated, isTrue);
    });

    test('logout unauthenticates and clears the session', () async {
      final store = FakeAuthSessionStore();
      final controller = AuthController(sessionStore: store);

      await controller.login();
      await controller.logout();

      expect(controller.isAuthenticated, isFalse);
      expect(store.authenticated, isFalse);
    });

    test('restoreSession restores an authenticated session', () async {
      final store = FakeAuthSessionStore()..authenticated = true;
      final controller = AuthController(sessionStore: store);

      await controller.restoreSession();

      expect(controller.isAuthenticated, isTrue);
    });
  });
}
