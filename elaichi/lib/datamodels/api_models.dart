/// Defines data model for login response.
class LoginResponse {
  /// The boolean value specifying if login was successful.
  final bool success;

  /// The firebase user ID.
  final String userId;

  /// The error/success message.
  final String message;

  /// Creates an instance of [LoginResponse].
  LoginResponse({
    this.success = true,
    this.userId,
    this.message,
  });
}
