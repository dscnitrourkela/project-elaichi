import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_registration.freezed.dart';
part 'event_registration.g.dart';

@freezed
class EventRegistration with _$EventRegistration {
  const factory EventRegistration({
    required String id,
    required String eventID,
    required String userID,
    User? user,
    Event? event,
  }) = _EventRegistration;

  factory EventRegistration.fromJson(Map<String, dynamic> json) =>
      _$EventRegistrationFromJson(json);
}
