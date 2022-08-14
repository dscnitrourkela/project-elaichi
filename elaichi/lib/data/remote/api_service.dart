import 'dart:convert';

import 'package:elaichi/data/constants/app_env.dart';
import 'package:elaichi/data/remote/custom_http_client.dart';

class APIService {
  factory APIService() {
    return _api;
  }

  APIService._internal();
  static final APIService _api = APIService._internal();

  static final CustomClient client = CustomClient(
    logLevel: ClientLogLevel.Info,
  );

  Future<String> logInToWebMail({
    required String rollNumber,
    required String password,
  }) async {
    final username = '$rollNumber@nitrkl.ac.in';
    final basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    final response = await client.post(
      Uri.parse(Env.webMailBaseUrl),
      headers: <String, String>{'authorization': basicAuth},
    );

    final rawCookie = response.headers['set-cookie'];

    if (response.statusCode == 400 && rawCookie != null) {
      final cookie = rawCookie.substring(14);

      return cookie.substring(0, cookie.indexOf(';'));
    } else if (response.statusCode == 401) {
      throw Exception('Authentication Error');
    } else {
      throw Exception('Unknown Error');
    }
  }
}
