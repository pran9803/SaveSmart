import 'package:go_router/go_router.dart';

import '../core/auth/auth_controller.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/startup/splash_screen.dart';
import 'routes.dart';

final authController = AuthController();

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,

  refreshListenable: authController,

  redirect: (context, state) {
    final authState = authController.state;
    final location = state.matchedLocation;

    if (authState.isInitializing) {
      if (location != AppRoutes.splash) {
        return AppRoutes.splash;
      }

      return null;
    }

    if (authState.isAuthenticated) {
      if (location == AppRoutes.splash || location == AppRoutes.login) {
        return AppRoutes.home;
      }

      return null;
    }

    if (location == AppRoutes.splash || location != AppRoutes.login) {
      return AppRoutes.login;
    }

    return null;
  },

  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
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
