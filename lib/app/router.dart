import 'package:go_router/go_router.dart';

import '../core/auth/auth_controller.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import 'routes.dart';

final authController = AuthController();

final appRouter = GoRouter(
  initialLocation: AppRoutes.login,

  refreshListenable: authController,

  redirect: (context, state) {
    final authState = authController.state;
    final isOnLogin = state.matchedLocation == AppRoutes.login;

    if (authState.isInitializing) {
      return null;
    }

    if (!authState.isAuthenticated && !isOnLogin) {
      return AppRoutes.login;
    }

    if (authState.isAuthenticated && isOnLogin) {
      return AppRoutes.home;
    }

    return null;
  },

  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
