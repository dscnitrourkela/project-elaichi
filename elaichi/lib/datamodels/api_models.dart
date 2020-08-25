import 'package:flutter/foundation.dart';

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

/// Defines data model for a user.
class User {
  /// The actual name of the user.
  final String name;

  /// The firebase user ID.
  final String userId;

  /// The user email.
  final String email;

  /// Creates an instance of [User].
  /// The strig argument [userId] must be non-null.
  User({
    this.name,
    @required this.userId,
    this.email,
  });
}
