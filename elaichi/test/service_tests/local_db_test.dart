import 'package:elaichi/services/local_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

class MockHive extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

void main() {
  MockHive mockHive;
  LocalDb localDb;

  setUp(() async {
    mockHive = MockHive();
    localDb = LocalDb();
    localDb.mockInstance = mockHive;

    await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.cache]);
  });

  group('Local DB -', () {
    test('Assertion errors of get, put and delete', () {
      when(mockHive.isBoxOpen(LocalDbBoxes.userData.toString()))
          .thenAnswer((_) => false);

      expect(() => localDb.getValue(LocalDbBoxes.userData, "DummyKey"),
          throwsAssertionError);
      expect(
          () =>
              localDb.putValue(LocalDbBoxes.userData, "DummyKey", "DummyValue"),
          throwsAssertionError);
      expect(() => localDb.deleteValue(LocalDbBoxes.userData, "DummyKey"),
          throwsAssertionError);
    });

    test('Open box', () async {
      when(mockHive.isBoxOpen(LocalDbBoxes.userData.toString()))
          .thenAnswer((_) => false);

      await localDb.openBox(LocalDbBoxes.userData);

      verify(mockHive.openBox(LocalDbBoxes.userData.toString()));
    });

    test('Open-Close box', () async {
      final _mockHiveBox = MockHiveBox();

      when(mockHive.isBoxOpen(LocalDbBoxes.userData.toString()))
          .thenAnswer((_) => false);
      await localDb.openBox(LocalDbBoxes.userData);
      verify(mockHive.openBox(LocalDbBoxes.userData.toString()));

      when(mockHive.isBoxOpen(LocalDbBoxes.userData.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.userData.toString()))
          .thenReturn(_mockHiveBox);
      await localDb.closeBox(LocalDbBoxes.userData);
      verify(_mockHiveBox.close());
    });

    test('Initialize and get cache box', () async {
      // Cache box is already opened in the initialization
      final _mockHiveBox = MockHiveBox();
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      await localDb.clearAndGetCacheBox();

      verify(mockHive.box(LocalDbBoxes.cache.toString()));
      verify(_mockHiveBox.clear());
    });

    test('Get non-existing data', () async {
      final _mockHiveBox = MockHiveBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      localDb.getValue(LocalDbBoxes.cache, 'Not Existing Key');

      verify(_mockHiveBox.get('Not Existing Key'));
    });

    test('Get non-existing default data', () async {
      final _mockHiveBox = MockHiveBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      final _result = localDb.getValue(LocalDbBoxes.cache, 'Not Existing Key',
          defaultValue: 'default');

      verify(_mockHiveBox.get('Not Existing Key'));
      expect(_result, 'default');
    });

    test('Put data', () async {
      final _mockHiveBox = MockHiveBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      localDb.putValue(LocalDbBoxes.cache, 'Existing Ankesh', 'Existing');
      verify(_mockHiveBox.put('Existing Ankesh', 'Existing'));
    });

    test('Delete data', () async {
      final _mockHiveBox = MockHiveBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      localDb.deleteValue(LocalDbBoxes.cache, 'key');

      verify(_mockHiveBox.delete('key'));
    });
  });
}
