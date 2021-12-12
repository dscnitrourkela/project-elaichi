part of 'home_cubit.dart';

/// Defines all the states of home page.
@freezed
class HomeState with _$HomeState {
  /// Initial state of home page.
  const factory HomeState.initial() = _Initial;

  /// Loading state of home page.
  const factory HomeState.loading() = _Loading;

  /// Success state of home page.
  const factory HomeState.success() = _Success;

  /// Feed Page State
  const factory HomeState.feedPage() = _FeedPage;

  /// Browse Page State
  const factory HomeState.browsePage() = _BrowsePage;

  /// Email Page State
  const factory HomeState.emailPage() = _EmailPage;

  /// Profile Page State
  const factory HomeState.profilePage() = _ProfilePage;

  /// Logged out State
  const factory HomeState.logOut() = _Logout;

  /// Error state of home page.
  const factory HomeState.error(String error) = _Error;
}
