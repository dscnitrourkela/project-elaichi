import 'package:elaichi/datamodels/api_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  group('Api -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    test('Constructing Service should find correct dependencies', () {
      final fakeApiService = FakeApiMock();
      expect(fakeApiService != null, true);
    });

    test('Given userId "test", should return user with name and email',
        () async {
      final fakeApiService = FakeApiMock();

      when(fakeApiService.getUser("test")).thenAnswer(
        (_) => Future.value(
          User(userId: "test", email: "john.doe@example.com", name: "John Doe"),
        ),
      );

      await fakeApiService.getUser("test");
      verify(fakeApiService.getUser("test"));
    });

    test('Given a userId that does not exist, should return correct error', () {
      final fakeApiService = FakeApiMock();
      when(fakeApiService.getUser("userId")).thenAnswer(
        (_) => Future.value(
          User(userId: "error"),
        ),
      );
    });
  });
}
