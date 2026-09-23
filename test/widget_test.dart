import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:save_smart/app/app.dart';

void main() {
  testWidgets('SaveSmart app starts correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const SaveSmartApp());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
