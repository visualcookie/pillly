import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pillly/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    Widget createTestWidget() {
      return const MaterialApp(home: HomeScreen());
    }

    testWidgets('should display app title and greeting', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Pillly'), findsOneWidget);

      final greetings = ['Good morning', 'Good afternoon', 'Good evening'];
      bool foundGreeting = false;
      for (final greeting in greetings) {
        if (tester.any(find.text(greeting))) {
          foundGreeting = true;
          break;
        }
      }
      expect(foundGreeting, true);
    });

    testWidgets('should display empty state', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('No medications yet'), findsOneWidget);
      expect(find.text('Add First Pill'), findsOneWidget);
      expect(find.byIcon(Icons.medication_rounded), findsOneWidget);
    });

    testWidgets('should show loading initially', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
