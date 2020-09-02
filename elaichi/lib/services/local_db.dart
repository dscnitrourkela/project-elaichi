import 'package:elaichi/app/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

/// Contains the key-value pairs of the boxes that can be used
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
  /// Instantiate the class with the boxes required as `boxesToOpen`
  Future<void> initLocalDb({List<LocalDbBoxes> boxesToOpen}) async {
    // Initialize and get the database local path
    await Hive.initFlutter();

    if (boxesToOpen != null) {
      for (final box in boxesToOpen) {
        await Hive.openBox(box.toString());
      }
    }
  }

  /// Open extra boxes
  Future<void> openBox(LocalDbBoxes boxName) async {
    if (!Hive.isBoxOpen(boxName.toString())) {
      await Hive.openBox(boxName.toString());
    }
  }

  /// To be used in dispose section for all the class
  Future<void> closeAllBoxes() async {
    await Hive.close();
  }

  /// Return the value after retrival from HiveBox named `boxName`, which is of
  /// the type LocalDbBoxes and with the `key` name
  ///
  /// Remember to wrap in try catch block
  dynamic getValue(LocalDbBoxes boxName, String key, {dynamic defaultValue}) {
    assert(Hive.isBoxOpen(boxName.toString()));
    // "$boxName is closed, please open before working with this box!");

    final _result = Hive.box(boxName.toString()).get(key);
    if (_result != null) {
      return _result;
    } else if (defaultValue != null) {
      return defaultValue;
    } else {
      throw Failure(0, 'Db returned null value');
    }
  }

  /// Put something intot the HiveBix names [boxName], which is of the type
  /// LocalDbName, with a String [key] and dynamic allowed types of [value]
  void putValue(LocalDbBoxes boxName, String key, dynamic value) {
    assert(Hive.isBoxOpen(boxName.toString()) == true,
        "$boxName is closed, please open before working with this box!");

    Hive.box(boxName.toString()).put(key, value);
  }
}
