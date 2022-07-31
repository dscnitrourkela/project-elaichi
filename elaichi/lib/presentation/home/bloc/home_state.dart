part of 'home_bloc.dart';

/// Defines all the states of home page.
@freezed
class HomeState with _$HomeState {
  /// Initial state of home page.
  const factory HomeState.initial() = _Initial;

  /// Loading state of home page.
  const factory HomeState.loading() = _Loading;

  /// Success state of home page.
  const factory HomeState.success() = _Success;

  /// Logouted of the app.
  const factory HomeState.loggedOut() = _LoggedOut;

  /// Error state of home page.
  const factory HomeState.error(String error) = _Error;
}
