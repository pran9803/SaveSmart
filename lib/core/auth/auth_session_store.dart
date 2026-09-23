import 'package:shared_preferences/shared_preferences.dart';

class AuthSessionStore {
  static const _authenticatedKey = 'auth_authenticated';

  Future<bool> isAuthenticated() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_authenticatedKey) ?? false;
  }

  Future<void> saveAuthenticated() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool(_authenticatedKey, true);
  }

  Future<void> clear() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(_authenticatedKey);
  }
}
