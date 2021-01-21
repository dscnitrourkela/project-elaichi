import 'package:elaichi/datamodels/auth_user.dart';

/// 
class Data {
  /// Constructor for [Data].
  Data({
    this.authUser,
  });

  /// Generates [Data] object from JSON resposne.
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authUser: json['authUser'] == null
            ? null
            : AuthUser.fromJson(json['authUser']),
      );

  /// Current user of the app.
  AuthUser authUser;

  /// Converts [Data] objcect to JSON.
  Map<String, dynamic> toJson() => {
        'authUser': authUser == null ? null : authUser.toJson(),
      };
}
