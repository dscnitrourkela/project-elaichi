import 'package:firebase_auth/firebase_auth.dart';

/// The data model for the [UserData]
class UserData {
  /// Private Constructor
  UserData._privateConstructor();

  /// The only Instacnce of the [UserData]
  factory UserData.instance() => _instance;

  static final UserData _instance = UserData._privateConstructor();

  /// The user object that is returned by FirebaseAuth.
  User? user;

  /// The user's zimbra email address
  String? email;

  /// The user's zimbra password and email base-64 encrypted token
  String? token;

  /// Get Function to retreive the  authenticated user
  User? get getUser => _instance.user;

  /// Get Function to retreive the  authenticated user's zimbra email address
  String? get getEmail => _instance.email;

  /// Get Function to retreive the  authenticated user's zimbra credentials
  String? get getPassword => _instance.token;
}
