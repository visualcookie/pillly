import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pillly/models/pill.dart';
import 'package:pillly/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('StorageService Tests', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      StorageService.resetInstance();
    });

    tearDown(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      StorageService.resetInstance();
    });

    test('should save and retrieve pills', () async {
      final storage = await StorageService.getInstance();
      final pill = Pill(
        id: 'test-id-1',
        name: 'Aspirin',
        description: 'For headache',
        reminderTime: const TimeOfDay(hour: 10, minute: 30),
      );

      await storage.savePill(pill);
      final pills = await storage.getAllPills();

      expect(pills.length, 1);
      expect(pills[0].name, 'Aspirin');
    });

    test('should update existing pill', () async {
      final storage = await StorageService.getInstance();
      final pill = Pill(
        id: 'test-id-1',
        name: 'Aspirin',
        description: 'For headache',
        reminderTime: const TimeOfDay(hour: 10, minute: 30),
      );

      await storage.savePill(pill);
      await storage.savePill(pill.copyWith(name: 'Updated Aspirin'));

      final pills = await storage.getAllPills();
      expect(pills.length, 1);
      expect(pills[0].name, 'Updated Aspirin');
    });

    test('should delete pill', () async {
      final storage = await StorageService.getInstance();
      final pill = Pill(
        id: 'test-id-1',
        name: 'Aspirin',
        description: 'For headache',
        reminderTime: const TimeOfDay(hour: 10, minute: 30),
      );

      await storage.savePill(pill);
      await storage.deletePill('test-id-1');

      final pills = await storage.getAllPills();
      expect(pills, isEmpty);
    });
  });
}
