part of 'sign_in_bloc.dart';

/// A class that manages all the States of the sign In feature.
@freezed
class SignInState with _$SignInState {
  /// A factory constructor for the [SignInState].
  const factory SignInState({
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInState;

  /// Returns the initial state of [SignInState].
  factory SignInState.initial() =>
      SignInState(isSubmitting: false, authFailureOrSuccessOption: none());
}
