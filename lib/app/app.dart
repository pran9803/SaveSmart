import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class SaveSmartApp extends StatelessWidget {
  const SaveSmartApp({super.key});

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
