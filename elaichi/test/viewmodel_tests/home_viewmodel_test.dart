import 'package:elaichi/ui/views/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helpers.dart';

void main() {
  setUp(() => registerServices());
  tearDown(() => unregisterServices());
  group('HomeViewmodelTest -', () {
    group('counter -', () {
      test('When constructed, counter should return 0', () {
        final model = HomeViewModel();
        expect(model.counter, 0);
      });

      test('When called, counter should increase', () {
        final model = HomeViewModel();
        model.updateCounter();
        expect(model.counter, 1);
      });
    });
  });
}
