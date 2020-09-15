import 'dart:io';

import 'package:elaichi/app/failure.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  setUp(() async {
    // Ensure bindings
    TestWidgetsFlutterBinding.ensureInitialized();

    // Create a temporary directory.
    final directory = await Directory.systemTemp.createTemp();

    // Mock out the MethodChannel for the path_provider plugin.
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      // If you're getting the apps documents directory, return the path to the
      // temp directory on the test environment instead.
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
  });

  group('Local DB -', () {
    test('Verify intitalized', () async {
      // Set
      final localDb = LocalDb();

      // Operate
      await localDb.initLocalDb();

      // Assertion
      expect(() => localDb.getValue(LocalDbBoxes.userData, 'Ankesh'),
          throwsAssertionError);
    });

    test('Open box', () async {
      final localDb = LocalDb();

      await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.preferences]);
      await localDb.openBox(LocalDbBoxes.userData);

      expect(Hive.isBoxOpen(LocalDbBoxes.userData.toString()), true);
      expect(Hive.isBoxOpen(LocalDbBoxes.preferences.toString()), true);
      expect(Hive.isBoxOpen(LocalDbBoxes.cache.toString()), false);
    });

    test('Open-Close box', () async {
      final localDb = LocalDb();

      await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.preferences]);
      await localDb.openBox(LocalDbBoxes.userData);

      expect(Hive.isBoxOpen(LocalDbBoxes.userData.toString()), true);
      expect(Hive.isBoxOpen(LocalDbBoxes.preferences.toString()), true);
      expect(Hive.isBoxOpen(LocalDbBoxes.cache.toString()), false);

      await localDb.closeAllBoxes();
      expect(Hive.isBoxOpen(LocalDbBoxes.userData.toString()), false);
      expect(Hive.isBoxOpen(LocalDbBoxes.preferences.toString()), false);
      expect(Hive.isBoxOpen(LocalDbBoxes.cache.toString()), false);
    });

    test('Get non-existing data', () async {
      final localDb = LocalDb();

      await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.userData]);

      expect(
          () => localDb.getValue(LocalDbBoxes.userData, 'Not Existing Ankesh'),
          throwsA(isA<Failure>()));
      await localDb.closeAllBoxes();
    });

    test('Put and get string data', () async {
      final localDb = LocalDb();

      await localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.userData]);

      localDb.putValue(LocalDbBoxes.userData, 'Existing Ankesh', 'Existing');
      final result = localDb.getValue(LocalDbBoxes.userData, 'Existing Ankesh');

      expect(result, 'Existing');
      await localDb.closeAllBoxes();
    });
  });
}
