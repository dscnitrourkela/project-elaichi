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
    _sharedPreferences
      ..setString('roll_number', rollNumber)
      ..setString('password', password);
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
      return _sharedPreferences.getString('password')!;
    } else {
      return null;
    }
  }

  void deleteWebmailDetails() {
    if (_sharedPreferences.containsKey('roll_number')) {
      _sharedPreferences.remove('roll_number');
    }
    if (_sharedPreferences.containsKey('password')) {
      _sharedPreferences.remove('password');
    }
  }
}
