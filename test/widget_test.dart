//
import 'package:flutter_test/flutter_test.dart';
import 'package:save_smart/app/app.dart';

void main() {
  testWidgets('SaveSmart app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const SaveSmartApp());

    expect(find.text('Welcome to SaveSmart'), findsOneWidget);
  });
}
