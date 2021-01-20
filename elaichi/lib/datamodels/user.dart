// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';
import 'package:meta/meta.dart';

/// Defines data model for a user.
class User {
  /// Creates an instance of [User].
  /// The strig argument [userId] must be non-null.
  User({
    @required this.userId,
    @required this.name,
    @required this.email,
  });
    /// Decodes json string and returns an instance of  [User].
  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  /// Creates an instance of [User] from supplied json.
  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json['userId'] ?? null,
        name: json['name'] ?? null,
        email: json['email'] ?? null,
      );

  /// The firebase user id.
  final String userId;

  /// The actual name of the user.
  final String name;

  /// The user email address.
  final String email;

  /// Encodes an instance of [User] into json.
  String toJson() => json.encode(toMap());



  /// Generates json for the [User] instance that calls toMap().
  Map<String, dynamic> toMap() => {
        'userId': userId ?? null,
        'name': name ?? null,
        'email': email ?? null,
      };
}
