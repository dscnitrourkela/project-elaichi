import 'package:elaichi/viewmodels.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeViewmodelTest -', () {
    group('title -', () {
      test('When constructed, title should not be null', () {
        final model = HomeViewModel();
        expect(model.title, isNotNull);
      });
    });
  });
}
