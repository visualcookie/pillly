import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pillly/models/pill.dart';

class StorageService {
  static const String _pillsKey = 'pillly_pills';

  static StorageService? _instance;
  static SharedPreferences? _prefs;

  StorageService._();

  static Future<StorageService> getInstance() async {
    _instance ??= StorageService._();
    _prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  @visibleForTesting
  static void resetInstance() {
    _instance = null;
    _prefs = null;
  }

  Future<List<Pill>> getAllPills() async {
    final pillsJson = _prefs?.getStringList(_pillsKey) ?? [];
    return pillsJson.map((json) => Pill.fromJsonString(json)).toList();
  }

  Future<void> savePill(Pill pill) async {
    final pills = await getAllPills();
    final existingIndex = pills.indexWhere((p) => p.id == pill.id);

    if (existingIndex != -1) {
      pills[existingIndex] = pill;
    } else {
      pills.add(pill);
    }

    await _savePills(pills);
  }

  Future<void> deletePill(String id) async {
    final pills = await getAllPills();
    pills.removeWhere((p) => p.id == id);
    await _savePills(pills);
  }

  Future<void> _savePills(List<Pill> pills) async {
    final pillsJson = pills.map((p) => p.toJsonString()).toList();
    await _prefs?.setStringList(_pillsKey, pillsJson);
  }
}
