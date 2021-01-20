import 'package:elaichi/ui/views/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() async {
    await registerServices();
  });
  tearDown(unregisterServices);
  group('HomeViewmodelTest -', () {
    group('title -', () {
      test('When constructed, title should not be null', () {
        final model = HomeViewModel();
        expect(model.title != null, true);
      });
    });
  });
}
