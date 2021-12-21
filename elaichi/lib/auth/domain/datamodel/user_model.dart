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

  /// The user's zimbra roll number
  String? rollNumber;

  /// The user's zimbra password and email base-64 encrypted token
  String? token;

  /// The user's zimbra authentication token
  String? authToken;

  /// Get Function to retreive the  authenticated user
  User? get getUser => _instance.user;

  /// Get Function to retreive the  authenticated user's zimbra roll Number
  String? get getRollNumber => _instance.rollNumber;

  /// Get Function to retreive the  authenticated user's zimbra credentials
  String? get getPassword => _instance.token;

  /// Get the authentication token of the user
  String? get getAuthToken => _instance.authToken;
}
