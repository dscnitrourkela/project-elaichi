import 'package:elaichi/app/failure.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

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
/// To put anything in the database use `LocalDb.putValue()` and `LocalDb.getValue()`
/// to retrieve from the database
@singleton
class LocalDb {
  /// Instance of Hive
  HiveInterface hive;

  /// Constructor function to initialize [LocalDb]. Pass `hive` if the instance is already present.
  LocalDb({this.hive}) {
    hive ??= Hive;
  }

  /// Instantiate the class with the boxes required as `boxesToOpen`
  Future<void> initLocalDb({List<LocalDbBoxes> boxesToOpen}) async {
    // Initialize and get the database local path
    await hive.initFlutter();

    if (boxesToOpen != null) {
      for (final box in boxesToOpen) {
        await hive.openBox(box.toString());
      }
    }
  }

  /// Open extra boxes
  Future<void> openBox(LocalDbBoxes boxName) async {
    if (!hive.isBoxOpen(boxName.toString())) {
      await hive.openBox(boxName.toString());
    }
  }

  /// Close any particular box
  Future<void> closeBox(LocalDbBoxes boxName) async {
    if (hive.isBoxOpen(boxName.toString())) {
      await hive.box(boxName.toString()).close();
    }
  }

  /// To be used in dispose section for all the class
  Future<void> closeAllBoxes() async {
    await hive.close();
  }

  /// Return the value after retrival from HiveBox named `boxName`, which is of
  /// the type LocalDbBoxes and with the `key` name
  dynamic getValue(LocalDbBoxes boxName, String key, {dynamic defaultValue}) {
    assert(hive.isBoxOpen(boxName.toString()));
    // "$boxName is closed, please open before working with this box!");

    return hive.box(boxName.toString()).get(key);
  }

  /// Put something into HiveBox `boxName` of the type
  /// LocalDbName, with `key` of type String and `value` of type dynamic
  void putValue(LocalDbBoxes boxName, String key, dynamic value) {
    assert(hive.isBoxOpen(boxName.toString()) == true,
        "$boxName is closed, please open before working with this box!");

    hive.box(boxName.toString()).put(key, value);
  }

  /// Delete something from HiveBox `boxName` of the type
  /// LocalDbName, with `key` of type String
  void deleteValue(LocalDbBoxes boxName, String key) {
    assert(hive.isBoxOpen(boxName.toString()) == true,
        "$boxName is closed, please open before working with this box!");

    hive.box(boxName.toString()).delete(key);
  }
}
