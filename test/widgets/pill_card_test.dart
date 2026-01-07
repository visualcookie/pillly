import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pillly/models/pill.dart';
import 'package:pillly/widgets/pill_card.dart';

void main() {
  group('PillCard Widget Tests', () {
    final testPill = Pill(
      id: 'test-id',
      name: 'Aspirin',
      description: 'For headache',
      reminderTime: const TimeOfDay(hour: 10, minute: 30),
    );

    Widget createTestWidget(Pill pill, {VoidCallback? onTap, VoidCallback? onDelete}) {
      return MaterialApp(
        home: Scaffold(
          body: PillCard(
            pill: pill,
            onTap: onTap ?? () {},
            onDelete: onDelete ?? () {},
          ),
        ),
      );
    }

    testWidgets('should display pill information', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testPill));

      expect(find.text('Aspirin'), findsOneWidget);
      expect(find.text('For headache'), findsOneWidget);
      expect(find.byIcon(Icons.medication_rounded), findsOneWidget);
    });

    testWidgets('should handle tap', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(createTestWidget(testPill, onTap: () => tapped = true));

      await tester.tap(find.byType(PillCard));
      await tester.pumpAndSettle();

      expect(tapped, true);
    });

    testWidgets('should be dismissible', (WidgetTester tester) async {
      bool deleted = false;
      await tester.pumpWidget(createTestWidget(testPill, onDelete: () => deleted = true));

      await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(deleted, true);
    });
  });
}
