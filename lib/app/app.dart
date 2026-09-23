import 'package:flutter/material.dart';

import '../core/auth/session_initializer.dart';
import 'router.dart';
import 'theme.dart';

class SaveSmartApp extends StatefulWidget {
  const SaveSmartApp({super.key});

  @override
  State<SaveSmartApp> createState() => _SaveSmartAppState();
}

class _SaveSmartAppState extends State<SaveSmartApp> {
  final SessionInitializer _sessionInitializer = const SessionInitializer();

  @override
  void initState() {
    super.initState();

    _initializeSession();
  }

  Future<void> _initializeSession() async {
    await _sessionInitializer.initialize(authController);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SaveSmart',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
