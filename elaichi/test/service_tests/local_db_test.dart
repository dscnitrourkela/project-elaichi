import 'package:elaichi/app/failure.dart';
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
    localDb = LocalDb(hive: mockHive);

    await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.cache]);
  });

  group('Local DB -', () {
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

    test('Close all box', () async {
      await localDb.closeAllBoxes();
      verify(mockHive.close());
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

    test('Put data', () async {
      final _mockHiveBox = MockHiveBox();
      when(mockHive.isBoxOpen(LocalDbBoxes.cache.toString()))
          .thenAnswer((_) => true);
      when(mockHive.box(LocalDbBoxes.cache.toString()))
          .thenReturn(_mockHiveBox);

      localDb.putValue(LocalDbBoxes.cache, 'Existing Ankesh', 'Existing');
      verify(_mockHiveBox.put('Existing Ankesh', 'Existing'));
    });

    test("Delete data", () async {
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
