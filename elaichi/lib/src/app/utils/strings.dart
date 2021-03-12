// ignore_for_file: public_member_api_docs
// ignore_for_file: constant_identifier_names

/// Contains all the string values that app is going to use.
abstract class Strings {
  static const String GRAPHQL_URL = 'https://avenue-api.nitrkl.in/';

  static const String BASE_URL = 'https://nitrkl.in';
  static const String DYNAMIC_LINK_DOMAIN = 'nitrkl.in';
  static const String PACKAGE_NAME = 'in.nitrkl';

  static const String IOS_BUNDLE_ID =
      'in.nitrkl.ios'; // Dummy, change when required

  // LocalDb keys
  static const String AUTH_USER_ID = 'authuser_id';
  static const String AUTH_USER_NAME = 'authuser_name';
  static const String AUTH_USER_USERNAME = 'authuser_username';
  static const String AUTH_USER_EMAIL = 'authuser_email';
  static const String AUTH_USER_MOBILE = 'authuser_mobile';
  static const String AUTH_USER_DP = 'authuser_dp';

  // Error codes
  static const String HTTP_ERROR = 'http_error';
  static const String GRAPHQL_ERROR = 'graphql_error';
  static const String NOT_EXISTING_USER = 'non_existing_user';
}
