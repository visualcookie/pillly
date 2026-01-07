import 'package:pillly/models/pill.dart';
import 'package:pillly/services/alarm_service.dart';
import 'package:pillly/services/storage_service.dart';

class PillUtils {
  static StorageService? _storage;
  static final AlarmService _alarmService = AlarmService();

  static Future<StorageService> _getStorage() async {
    _storage ??= await StorageService.getInstance();
    return _storage!;
  }

  Future<void> savePill(Pill pill) async {
    final storage = await _getStorage();
    await storage.savePill(pill);
    await _alarmService.scheduleAlarm(pill);
  }

  Future<void> deletePill(String id) async {
    final storage = await _getStorage();
    await storage.deletePill(id);
    await _alarmService.deleteAlarm(id);
  }

  Future<List<Pill>> getPills() async {
    final storage = await _getStorage();
    return await storage.getAllPills();
  }
}
