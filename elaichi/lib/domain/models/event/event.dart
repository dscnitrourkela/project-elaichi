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
    required String id,
    required String name,
    required String subHeading,
    required String prizeMoney,
    required String description,
    required String poster,
    required DateTime startDate,
    required DateTime endDate,
    required OrgType orgType,
    List<String>? notes,
    required bool weekly,
    RepeatType? repeatDay,
    required int priority,
    String? type,
    required StatusType status,
    required String locationID,
    List<String>? pocID,
    List<String>? orgID,
    List<Org>? org,
    Location? location,
    User? poc,
  }) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}
