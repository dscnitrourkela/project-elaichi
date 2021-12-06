part of 'sign_in_cubit.dart';

/// All the possible states of Sign In feature.
@freezed
class SignInState with _$SignInState {
  /// The initial state.
  const factory SignInState.initial() = _Initial;

  /// Loading state.
  const factory SignInState.loading() = _Loading;

  /// Error state.
  const factory SignInState.error(String error) = _Error;

  /// Success state.
  const factory SignInState.success() = _Success;
}
