import 'package:flutter_test/flutter_test.dart';
import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(unregisterServices);
}
