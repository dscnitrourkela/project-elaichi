import 'package:elaichi/domain/exceptions/local_storage_exception.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late final SharedPreferences _sharedPreferences;
  static late final LocalStorageService _instance;
  static User? _currentUser;

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
    try {
      _sharedPreferences
        ..setString('roll_number', rollNumber)
        ..setString('password', password);
    } catch (e) {
      throw LocalStorageException(e.toString());
    }
  }

  set rollNumber(String? rollNumber) =>
      _sharedPreferences.setString('roll_number', rollNumber!);

  set firebaseToken(String firebaseToken) {
    _sharedPreferences.setString('firebaseToken', firebaseToken);
  }

  String get firebaseToken {
    if (_sharedPreferences.containsKey('firebaseToken')) {
      return _sharedPreferences.getString('firebaseToken')!;
    } else {
      return 'Token not found';
    }
  }

  set currentUser(User? user) => _currentUser = user;

  User? get currentUser => _currentUser;

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
