part of 'fest_bloc.dart';

@freezed
class FestEvent with _$FestEvent {
  const factory FestEvent.started() = _Started;

  const factory FestEvent.webMailLogIn() = _WebMailLogIn;
}
