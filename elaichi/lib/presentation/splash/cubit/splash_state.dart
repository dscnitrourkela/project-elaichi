part of 'splash_cubit.dart';

/// ALl the possible states in User Data Fetching
@freezed
class SplashState with _$SplashState {
  ///The initial state of [SplashState]
  const factory SplashState.initial() = _Initial;

  ///The state when the [SplashState] is loading
  const factory SplashState.loading() = _Loading;

  ///The state when there is No User Data - Unauthenticated User
  const factory SplashState.unauthenticated() = _Unauthenticated;

  ///The state where the User is Google Authenticated
  const factory SplashState.googleAuthenticated() = _GoogleAuthenticated;

  ///The state where the User is Zimbra Authenticated
  const factory SplashState.zimbraAuthenticated() = _ZimbraAuthenticated;

  /// Error state.
  const factory SplashState.error(String error) = _Error;
}
