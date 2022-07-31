import 'package:firebase_auth/firebase_auth.dart';

/// The data model for the [Splash]
class Splash {
  /// Private Constructor
  Splash._privateConstructor();

  /// The only Instacnce of the [Splash]
  factory Splash.instance() => _instance;

  static final Splash _instance = Splash._privateConstructor();

  /// The user object that is returned by FirebaseAuth.
  User? user;

  /// The user's zimbra email address
  String? email;

  /// The user's zimbra password
  String? password;

  /// Get Function to retreive the  authenticated user
  User? get getUser => _instance.user;

  /// Get Function to retreive the  authenticated user's zimbra email address
  String? get getEmail => _instance.email;

  /// Get Function to retreive the  authenticated user's zimbra credentials
  String? get getPassword => _instance.password;
}
