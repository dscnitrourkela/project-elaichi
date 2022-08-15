part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.webMailLoggedOut() = _WebMailLoggedOut;

  const factory ProfileState.appLoggedOut() = _AppLoggedOut;

  const factory ProfileState.error(String error) = _Error;
}
