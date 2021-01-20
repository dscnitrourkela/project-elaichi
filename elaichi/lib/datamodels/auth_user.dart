// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_if_null_operators

/// AuthUser mutation reply.
class AuthUser {
  /// Contructor of [AuthUser]
  AuthUser({
    this.id,
    this.name,
    this.username,
    this.gmailAuthMail,
    this.mobile,
    this.displayPicture,
  });

  String id;
  String name;
  String username;
  String gmailAuthMail;
  dynamic mobile;
  String displayPicture;

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        gmailAuthMail:
            json["gmailAuthMail"] == null ? null : json["gmailAuthMail"],
        mobile: json["mobile"],
        displayPicture:
            json["displayPicture"] == null ? null : json["displayPicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "gmailAuthMail": gmailAuthMail == null ? null : gmailAuthMail,
        "mobile": mobile,
        "displayPicture": displayPicture == null ? null : displayPicture,
      };
}
