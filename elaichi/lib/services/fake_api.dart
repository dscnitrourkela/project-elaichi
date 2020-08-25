import 'package:elaichi/app/config/injectable_config.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/services/api.dart';
import 'package:injectable/injectable.dart';

/// An implementation of Api class to feed fake data to the app.
/// Use this for development during internet outages, server downtime,
/// or API unavailability. Helps in rapid prototyping of the app.
@Named("fakeApi")
@fake
@LazySingleton(as: Api)
class FakeApi implements Api {
  @override
  Future<User> getUser(String userId) async {
    await Future.delayed(const Duration(seconds: 1));

    if (userId == "test") {
      return User(
          userId: "test", email: "john.doe@example.com", name: "John Doe");
    }

    return null;
  }

  @override
  Future<LoginResponse> login({String username, String password}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == "test") {
      return LoginResponse(
          userId: "test", message: "Login successful for user: $username");
    }

    return LoginResponse(success: false, message: "Login unsuccesful");
  }
}
