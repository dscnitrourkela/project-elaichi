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
    group('counter -', () {
      test('When constructed, counter should return 0', () {
        final model = HomeViewModel();
        expect(model.counter, 0);
      });

      test('When called, counter should increase', () {
        final model = HomeViewModel()..updateCounter();
        // model.updateCounter();
        expect(model.counter, 1);
      });
    });
  });
}
