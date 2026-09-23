import 'package:flutter/material.dart';

class SaveSmartApp extends StatelessWidget {
  const SaveSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SaveSmart',

      theme: ThemeData(useMaterial3: true),

      home: const Scaffold(
        body: Center(
          child: Text(
            'SaveSmart',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
