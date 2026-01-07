import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pillly/models/pill.dart';

void main() {
  group('Pill Model Tests', () {
    test('should create and serialize pill correctly', () {
      final pill = Pill(
        id: 'test-id',
        name: 'Aspirin',
        description: 'For headache',
        reminderTime: const TimeOfDay(hour: 10, minute: 30),
        createdAt: DateTime(2024, 1, 1),
      );

      expect(pill.id, 'test-id');
      expect(pill.name, 'Aspirin');
      expect(pill.description, 'For headache');

      final jsonString = pill.toJsonString();
      final decodedPill = Pill.fromJsonString(jsonString);

      expect(decodedPill.id, pill.id);
      expect(decodedPill.name, pill.name);
      expect(decodedPill.reminderTime.hour, pill.reminderTime.hour);
      expect(decodedPill.reminderTime.minute, pill.reminderTime.minute);
    });

    test('should handle copyWith correctly', () {
      final originalPill = Pill(
        id: 'test-id',
        name: 'Aspirin',
        description: 'For headache',
        reminderTime: const TimeOfDay(hour: 10, minute: 30),
      );

      final copiedPill = originalPill.copyWith(name: 'Ibuprofen');

      expect(copiedPill.id, originalPill.id);
      expect(copiedPill.name, 'Ibuprofen');
      expect(copiedPill.description, originalPill.description);
    });
  });
}
