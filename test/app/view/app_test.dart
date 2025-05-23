import 'package:clever_buddy/app/app.dart';
import 'package:clever_buddy/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(RegisterPage), findsOneWidget);
    });
  });
}
