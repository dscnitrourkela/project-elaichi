/// AuthUser mutation reply.
class AuthUser {
  /// Constructor for [AuthUser]
  AuthUser({
    this.id,
    this.name,
    this.username,
    this.gmailAuthMail,
    this.mobile,
    this.displayPicture,
  });

  /// Generates [AuthUser] object from JSON response.
  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        gmailAuthMail:
            json['gmailAuthMail'],
        mobile: json['mobile'],
        displayPicture:
            json['displayPicture'],
      );
  
  /// ID of the auth user.
  String id;

  /// Name of the auth user.
  String name;

  /// Username of the auth user.
  String username;

  /// Gmail ID of the auth user.
  String gmailAuthMail;

  /// Mobile number of the auth user.
  dynamic mobile;

  /// Display picture URL of the auth user.
  String displayPicture;

  /// Converts [AuthUser] object into JSON.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'gmailAuthMail': gmailAuthMail,
        'mobile': mobile,
        'displayPicture': displayPicture,
      };
}
