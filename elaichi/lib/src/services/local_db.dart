import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Contains the boxNames that can be used for LocalDb
enum LocalDbBoxes {
  /// Preferences box for settings like `darkMode`
  preferences,

  /// User data box for user data like `name`, `email`, etc.
  userData,

  /// Local cache data like API request and response data
  cache,
}

/// Implements local database which can be used to store users data, local app
/// preferences and caching.
/// To put anything in the database use `LocalDb.putValue()` and
/// `LocalDb.getValue()`
/// to retrieve from the database
class LocalDb {
  /// Instance of Hive
  HiveInterface? hive = Hive;

  /// Pass `hive` if an instance is already present (especially for testing)
  // ignore: avoid_setters_without_getters
  set mockInstance(HiveInterface? hive) {
    this.hive = hive;
  }

  /// Instantiate the class with the boxes required as `boxesToOpen`
  Future<void>? initLocalDb({List<LocalDbBoxes>? boxesToOpen}) async {
    // Initialize and get the database local path
    await hive!.initFlutter();

    if (boxesToOpen != null) {
      for (final box in boxesToOpen) {
        await hive!.openBox(box.toString());
      }
    }
  }

  /// Open extra boxes
  Future<void> openBox(LocalDbBoxes boxName) async {
    if (!hive!.isBoxOpen(boxName.toString())) {
      await hive!.openBox(boxName.toString());
    }
  }

  /// Close any particular box
  Future<void> closeBox(LocalDbBoxes boxName) async {
    if (hive!.isBoxOpen(boxName.toString())) {
      await hive!.box(boxName.toString()).close();
    }
  }

  /// Initializes cache box and return it.
  Future<Box> getCacheBox() async {
    final cacheBox = hive!.box(LocalDbBoxes.cache.toString());
    return cacheBox;
  }

  /// Return the value after retrival from HiveBox `boxName` of
  /// the type LocalDbBoxes and with the `key`. If null then defaultValue is
  /// returned if set
  dynamic getValue(LocalDbBoxes boxName, String key, {dynamic defaultValue}) {
    assert(hive!.isBoxOpen(boxName.toString()));

    dynamic _result = hive!.box(boxName.toString()).get(key);
    return _result ??= defaultValue;
  }

  /// Put something into HiveBox `boxName` of the type
  /// LocalDbName, with `key` of type String and `value` of type dynamic
  void putValue(LocalDbBoxes boxName, String key, dynamic value) {
    assert(hive!.isBoxOpen(boxName.toString()) == true,
        '$boxName is closed, please open before working with this box!');

    hive!.box(boxName.toString()).put(key, value);
  }

  /// Delete something from HiveBox `boxName` of the type
  /// LocalDbName, with `key` of type String
  void deleteValue(LocalDbBoxes boxName, String key) {
    assert(hive!.isBoxOpen(boxName.toString()) == true,
        '$boxName is closed, please open before working with this box!');

    hive!.box(boxName.toString()).delete(key);
  }
}
