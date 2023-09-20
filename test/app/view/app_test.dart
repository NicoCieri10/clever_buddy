import 'package:clever_buddy/app/app.dart';
import 'package:clever_buddy/register/register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const PageApp());
      expect(find.byType(RegisterPage), findsOneWidget);
    });
  });
}
