part of 'sign_in_bloc.dart';

/// A class that handles all the events of sign in feature.
@freezed
class SignInEvent with _$SignInEvent {
  /// A function that decides what happens after `Sign In With Google` button is
  /// pressed.
  const factory SignInEvent.signInWithGooglePressed() =
      _SignInWithGooglePressed;
}
