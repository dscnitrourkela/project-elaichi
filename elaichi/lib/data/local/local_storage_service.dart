import 'package:elaichi/data/local/encoding_service.dart';
import 'package:elaichi/domain/exceptions/local_storage_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late final SharedPreferences _sharedPreferences;
  static late final LocalStorageService _instance;

  ///Must only be called once.
  static Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    // ignore: join_return_with_assignment
    _instance = LocalStorageService();
    return _instance;
  }

  void saveWebMailDetails({
    required String rollNumber,
    required String password,
  }) {
    final encodedPassword = encodedToBase64(password);

    try {
      _sharedPreferences
        ..setString('roll_number', rollNumber)
        ..setString('password', encodedPassword);
    } catch (e) {
      throw LocalStorageException(e.toString());
    }
  }

  String? get rollNumber {
    if (_sharedPreferences.containsKey('roll_number')) {
      return _sharedPreferences.getString('roll_number')!;
    } else {
      return null;
    }
  }

  String? get password {
    if (_sharedPreferences.containsKey('password')) {
      final encodedPassword = _sharedPreferences.getString('password')!;
      return decodedFromBase64(encodedPassword);
    } else {
      return null;
    }
  }

  void deleteWebmailDetails() {
    try {
      if (_sharedPreferences.containsKey('roll_number')) {
        _sharedPreferences.remove('roll_number');
      }
      if (_sharedPreferences.containsKey('password')) {
        _sharedPreferences.remove('password');
      }
    } catch (e) {
      throw LocalStorageException(e.toString());
    }
  }
}
