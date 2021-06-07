import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

http.StreamedResponse response({required String body, int? status}) {
  final bytes = utf8.encode(body);
  final stream = Stream<List<int>>.fromIterable(<List<int>>[bytes]);

  final res = http.StreamedResponse(stream, status ?? 200);

  return res;
}
