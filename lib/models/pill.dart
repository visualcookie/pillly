import 'dart:convert';

import 'package:flutter/material.dart';

class Pill {
  final String id;
  final String name;
  final String description;
  final TimeOfDay reminderTime;
  final DateTime createdAt;

  Pill({
    required this.id,
    required this.name,
    required this.description,
    required this.reminderTime,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Pill copyWith({
    String? id,
    String? name,
    String? description,
    TimeOfDay? reminderTime,
    DateTime? createdAt,
  }) {
    return Pill(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      reminderTime: reminderTime ?? this.reminderTime,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'reminderTimeHour': reminderTime.hour,
      'reminderTimeMinute': reminderTime.minute,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Pill.fromJson(Map<String, dynamic> json) {
    return Pill(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      reminderTime: TimeOfDay(
        hour: json['reminderTimeHour'] as int,
        minute: json['reminderTimeMinute'] as int,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  String toJsonString() => jsonEncode(toJson());

  factory Pill.fromJsonString(String jsonString) {
    return Pill.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }

  String reminderTimeDisplayName(BuildContext context) =>
      reminderTime.format(context);
}
