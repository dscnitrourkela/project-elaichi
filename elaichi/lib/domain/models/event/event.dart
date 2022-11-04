// ignore_for_file: constant_identifier_names

import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/models/location/location.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String description,
    required DateTime endDate,
    required String id,
    Location? location,
    required String locationID,
    required String name,
    required List<String> notes,
    required List<Org> org,
    required List<String> orgID,
    required OrgType orgType,
    required User poc,
    required List<String> pocID,
    required String poster,
    required int proiority,
    RepeatType? repeatDay,
    required DateTime startDate,
    required StatusType status,
    String? type,
    required bool weekly,
  }) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}
