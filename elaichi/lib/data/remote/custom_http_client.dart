// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:http/http.dart';

enum ClientLogLevel {
  None,
  Info,
  Warn,
}

class CustomClient extends BaseClient {
  CustomClient({required this.logLevel});

  static final Client client = Client();
  final ClientLogLevel logLevel;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (logLevel == ClientLogLevel.Info) {
      log('>>>> ${request.method} @ ${request.url.path}');
    }
    final response = await client.send(request);
    switch (logLevel) {
      case ClientLogLevel.Info:
        log('<<<< ${response.statusCode} => ${response.reasonPhrase}');
        break;
      case ClientLogLevel.Warn:
        if (response.statusCode.toString()[0] != '2') {
          log('<<<< ${response.statusCode} => ${response.reasonPhrase}');
        }
        break;
      // ignore: no_default_cases
      default:
    }
    return response;
  }
}
