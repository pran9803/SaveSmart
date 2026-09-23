import 'package:flutter/material.dart';

//import '../core/auth/auth_controller.dart';
import 'router.dart';
import 'theme.dart';

class SaveSmartApp extends StatefulWidget {
  const SaveSmartApp({super.key});

  @override
  State<SaveSmartApp> createState() => _SaveSmartAppState();
}

class _SaveSmartAppState extends State<SaveSmartApp> {
  @override
  void initState() {
    super.initState();

    _restoreSession();
  }

  Future<void> _restoreSession() async {
    await authController.restoreSession();
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
