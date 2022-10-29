// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String name,
    required EventCategory category,
    required EventType type,
    required DateTime startTime,
    required int durationInMin,
    required String location,
    required String image,
    required String description,
  }) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}

enum EventCategory { ACADEMIC, MESS, CLUB, INSTITUTE }

enum EventType { ONET, WEEKLY }
