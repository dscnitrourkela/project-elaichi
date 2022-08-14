part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.webMailLogOut() = _WebMailLogOut;

  const factory ProfileEvent.appLogOut() = _AppLogOut;
}
