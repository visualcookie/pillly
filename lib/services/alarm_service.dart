import 'package:alarm/alarm.dart';
import 'package:alarm/utils/alarm_set.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pillly/models/pill.dart';
import 'package:pillly/utils/pill_utils.dart';

class AlarmService {
  Future<void> scheduleAlarm(Pill pill, {bool forceNextDay = false}) async {
    final alarm = await _getAlarmSettings(pill, forceNextDay: forceNextDay);
    await Alarm.set(alarmSettings: alarm);
  }

  Future<void> rescheduleAlarm(int alarmId) async {
    final pills = await PillUtils().getPills();
    final pill = pills.firstWhere((p) => p.id.hashCode == alarmId);
    await Alarm.stop(alarmId);
    await scheduleAlarm(pill, forceNextDay: true);
  }

  Future<void> deleteAlarm(String pillId) async {
    await Alarm.stop(pillId.hashCode);
  }

  void startListening({required Function(AlarmSettings) onAlarm}) {
    Alarm.ringing.listen((AlarmSet alarmSet) {
      for (final alarm in alarmSet.alarms) {
        onAlarm(alarm);
      }
    });
  }

  Future<void> requestPermissions() async {
    final scheduleAlarmPermissionStatus =
        await Permission.scheduleExactAlarm.status;
    final notificationPermissionStatus = await Permission.notification.status;

    if (notificationPermissionStatus.isDenied ||
        notificationPermissionStatus.isPermanentlyDenied) {
      await Permission.notification.request();
    }

    if (scheduleAlarmPermissionStatus.isDenied ||
        scheduleAlarmPermissionStatus.isPermanentlyDenied) {
      await Permission.scheduleExactAlarm.request();
    }
  }

  Future<AlarmSettings> _getAlarmSettings(
    Pill pill, {
    bool forceNextDay = false,
  }) async {
    return AlarmSettings(
      id: pill.id.hashCode,
      dateTime: _getNextAlarmTime(
        pill.reminderTime,
        forceNextDay: forceNextDay,
      ),
      assetAudioPath: 'assets/sounds/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(
        volume: 0.4,
        fadeDuration: Duration(seconds: 10),
      ),
      notificationSettings: NotificationSettings(
        title: "It's time to take ${pill.name}",
        body: pill.description.isNotEmpty
            ? pill.description
            : "Remember to take your pill.",
        stopButton: "Done",
      ),
    );
  }

  DateTime _getNextAlarmTime(
    TimeOfDay reminderTime, {
    bool forceNextDay = false,
  }) {
    final now = DateTime.now();
    final nextAlarm = DateTime(
      now.year,
      now.month,
      now.day,
      reminderTime.hour,
      reminderTime.minute,
    );

    if (nextAlarm.isBefore(now) || forceNextDay) {
      return nextAlarm.add(const Duration(days: 1));
    }

    return nextAlarm;
  }
}
