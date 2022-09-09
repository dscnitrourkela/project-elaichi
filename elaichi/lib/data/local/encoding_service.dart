import 'dart:convert';

String encodedToBase64(String string) {
  final encodedString = base64.encode(
    utf8.encode(string),
  );

  return encodedString;
}

String decodedFromBase64(String encodedString) {
  final decodedString = utf8.decode(
    base64.decode(encodedString),
  );

  return decodedString;
}
