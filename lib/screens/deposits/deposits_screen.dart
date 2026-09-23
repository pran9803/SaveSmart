import 'package:flutter/material.dart';

class DepositsScreen extends StatelessWidget {
  const DepositsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deposits')),
      body: const Center(child: Text('Deposits')),
    );
  }
}
