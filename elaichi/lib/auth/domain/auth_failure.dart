import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// A class for all handling the possible failures while authentication.
@freezed
class AuthFailure with _$AuthFailure {
  /// A case where the user cancels the sign in.
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  /// A case where there's a failure caused due to error on the server side
  const factory AuthFailure.serverError() = ServerError;
}
