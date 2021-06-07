import 'package:elaichi/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_db_test.mocks.dart';

// class MockHive extends Mock implements HiveInterface {}

// class MockBox extends Mock implements Box {}
@GenerateMocks([Box, HiveInterface])
void main() {
  late MockHiveInterface mockHive;
  late LocalDb localDb;

  setUp(() async {
    mockHive = MockHiveInterface();
    localDb = LocalDb();
    localDb.mockInstance = mockHive;

    when(mockHive.openBox(any)).thenAnswer((_) async => MockBox());
    await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.userData]);
  });

  group('Local DB -', () {
    test('Assertion errors of get, put and delete', () {
      when(mockHive.isBoxOpen(LocalDbBoxes.userData.toString()))
          .thenAnswer((_) => false);

      expect(() => localDb.getValue(LocalDbBoxes.userData, 'DummyKey'),
          throwsAssertionError);
      expect(
          () =>
              localDb.putValue(LocalDbBoxes.userData, 'DummyKey', 'DummyValue'),
          throwsAssertionError);
      expect(() => localDb.deleteValue(LocalDbBoxes.userData, 'DummyKey'),
          throwsAssertionError);
    });

    test('Open box', () async {
      when(mockHive.isBoxOpen(any)).thenAnswer((_) => false);
      when(mockHive.openBox(any)).thenAnswer((_) async => MockBox());

      await localDb.openBox(LocalDbBoxes.userData);

      verify(mockHive.openBox(LocalDbBoxes.userData.toString()));
    });

    test('Open-Close box', () async {
      final _mockHiveBox = MockBox();

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
      final _mockHiveBox = MockBox();
      when(mockHive.box(any)).thenReturn(_mockHiveBox);

      await localDb.getCacheBox();

      verify(mockHive.box(LocalDbBoxes.cache.toString()));
    });

    test('Get non-existing data', () async {
      final _mockHiveBox = MockBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);
      when(_mockHiveBox.get(any)).thenReturn('test');

      localDb.getValue(LocalDbBoxes.cache, 'Not Existing Key');

      verify(_mockHiveBox.get('Not Existing Key'));
    });

    test('Get non-existing default data', () async {
      final _mockHiveBox = MockBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);
      when(_mockHiveBox.get(any)).thenReturn('default');

      final _result = localDb.getValue(LocalDbBoxes.cache, 'Not Existing Key',
          defaultValue: 'default');

      verify(_mockHiveBox.get('Not Existing Key'));
      expect(_result, 'default');
    });

    test('Put data', () async {
      final _mockHiveBox = MockBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      localDb.putValue(LocalDbBoxes.cache, 'Existing Ankesh', 'Existing');
      verify(_mockHiveBox.put('Existing Ankesh', 'Existing'));
    });

    test('Delete data', () async {
      final _mockHiveBox = MockBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      localDb.deleteValue(LocalDbBoxes.cache, 'key');

      verify(_mockHiveBox.delete('key'));
    });
  });
}
