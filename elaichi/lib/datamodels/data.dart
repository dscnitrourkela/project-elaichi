// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_null_aware_operators

import 'package:elaichi/datamodels/auth_user.dart';

class Data {
  Data({
    this.authUser,
  });

  AuthUser authUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authUser: json["authUser"] == null
            ? null
            : AuthUser.fromJson(json["authUser"]),
      );

  Map<String, dynamic> toJson() => {
        "authUser": authUser == null ? null : authUser.toJson(),
      };
}
