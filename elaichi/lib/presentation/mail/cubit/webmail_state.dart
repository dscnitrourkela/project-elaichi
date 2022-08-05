part of 'webmail_cubit.dart';

@freezed
class WebmailState with _$WebmailState {
  const factory WebmailState.initial() = _Initial;

  const factory WebmailState.loading() = _Loading;

  const factory WebmailState.authenticated() = _Authenticated;

  const factory WebmailState.unauthenticated() = _UnAuthenticated;

  const factory WebmailState.error(String error) = _Error;
}
