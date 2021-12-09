part of 'user_data_cubit.dart';

/// ALl the possible states in User Data Fetching
@freezed
class UserDataState with _$UserDataState {
  ///The initial state of [UserDataState]
  const factory UserDataState.initial() = _Initial;

  ///The state when the [UserDataState] is loading
  const factory UserDataState.loading() = _Loading;

  ///The state when there is No User Data - Unauthenticated User
  const factory UserDataState.unauthenticated() = _Unauthenticated;

  ///The state where the User is Google Authenticated
  const factory UserDataState.googleAuthenticated() = _GoogleAuthenticated;

  ///The state where the User is Zimbra Authenticated
  const factory UserDataState.zimbraAuthenticated() = _ZimbraAuthenticated;

  /// Error state.
  const factory UserDataState.error(String error) = _Error;
}
