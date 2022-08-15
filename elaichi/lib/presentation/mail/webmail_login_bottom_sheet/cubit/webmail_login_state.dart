part of 'webmail_login_cubit.dart';

@freezed
class WebMailLoginState with _$WebMailLoginState {
  const factory WebMailLoginState.initial() = _Initial;

  const factory WebMailLoginState.loading() = _Loading;

  const factory WebMailLoginState.success() = _Success;

  const factory WebMailLoginState.error(String error) = _Error;
}
