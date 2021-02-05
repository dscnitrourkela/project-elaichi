import 'package:elaichi/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Failure - toString test',
    () {
      final failure = Failure(1, 'Test message');
      expect(failure.toString(), equals('Test message'));
    },
  );
}
