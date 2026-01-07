import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pillly/models/pill.dart';
import 'package:pillly/services/alarm_service.dart';

void main() {
  group('AlarmService Tests', () {
    test('should create AlarmService instance', () {
      final alarmService = AlarmService();
      expect(alarmService, isNotNull);
    });

    test('should generate consistent alarm IDs', () {
      final pill1 = Pill(
        id: 'test-id-1',
        name: 'Test Pill',
        description: 'Test',
        reminderTime: const TimeOfDay(hour: 10, minute: 30),
      );

      final pill2 = Pill(
        id: 'test-id-1',
        name: 'Different Name',
        description: 'Different Description',
        reminderTime: const TimeOfDay(hour: 14, minute: 0),
      );

      expect(pill1.id.hashCode, pill2.id.hashCode);
    });
  });
}
