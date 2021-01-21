import 'package:elaichi/datamodels/auth_user.dart';

///
class Data {
  /// Constructor for [Data].
  Data({
    this.authUser,
  });

  /// Generates [Data] object from JSON resposne.
  factory Data.fromJson(Map<String, dynamic> json) {
    if (json['authUser'] != null) {
      return Data(authUser: AuthUser.fromJson(json['authUser']));
    } else if (json['updateUser'] != null) {
      return Data(authUser: AuthUser.fromJson(json['updateUser']));
    } else {
      return Data(authUser: null);
    }
  }

  /// Current user of the app.
  AuthUser authUser;

  /// Converts [Data] objcect to JSON.
  Map<String, dynamic> toJson() => {
        'authUser': authUser == null ? null : authUser.toJson(),
      };
}
