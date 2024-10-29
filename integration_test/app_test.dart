import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab9/main.dart' as app;
import 'package:lab9/success.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'testing login and register',
    () {
      testWidgets(
        'tap login, input email, phone, tap submit',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('login')));
          await tester.pumpAndSettle();
          await tester.enterText(find.byKey(const Key('email')), 'user@gmail.com');
          await tester.enterText(find.byKey(const Key('phone')), '79296661234');
          await tester.tap(find.byKey(const Key('submit')));
          await tester.pumpAndSettle();
          expect(find.byType(Success), findsOneWidget);
        },
      );
      testWidgets(
        'tap register, input first name, last name, email, phone, tap submit',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('register')));
          await tester.pumpAndSettle();
          await tester.enterText(find.byKey(const Key('firstName')), 'Иван');
          await tester.enterText(find.byKey(const Key('lastName')), 'Иванов');
          await tester.enterText(find.byKey(const Key('email')), 'user@gmail.com');
          await tester.enterText(find.byKey(const Key('phone')), '79296661234');
          await tester.tap(find.byKey(const Key('submit')));
          await tester.pumpAndSettle();
          expect(find.byType(Success), findsOneWidget);
        },
      );
    },
  );
}
