import 'auth_controller.dart';

class SessionInitializer {
  const SessionInitializer();

  Future<void> initialize(AuthController authController) async {
    await authController.restoreSession();
  }
}
