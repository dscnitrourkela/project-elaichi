import 'dart:io';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/services/api.dart';
import 'package:injectable/injectable.dart';

/// An implementation of Api class to feed fake data to the app.
/// Use this for development during internet outages, server downtime,
/// or API unavailability. Helps in rapid prototyping of the app.

@LazySingleton(as: Api, env: [Env.dev])
class FakeApi implements Api {
  /// Mocks an user API call.
  ///
  /// The optional integer parameter [errorMode] can be utilised to return
  /// errors.
  /// It is 0 by default.
  ///
  /// The following errors are available in the function call:
  ///
  /// * 0 -> No error(default)
  ///
  /// * 1 -> Throws a [SocketException] to simulate internet connection error.
  ///
  /// * 2 -> Throws an HttpExcepiton to simulate an Http error.
  ///
  /// * 3 -> Returns invalid JSON string that leads to a [FormatException].
  @override
  Future<String> getUser(String userId, {int errorMode = 0}) async {
    await Future.delayed(const Duration(seconds: 1));

    switch (errorMode) {
      case 1:
        throw const SocketException('No internet connection');
        break;
      case 2:
        throw const HttpException('User not found');
        break;
      case 3:
        return 'abcd';
        break;
      case 0:
        if (userId == 'test') {
          return '''
            {
              "userId":"test",
              "name":"John Doe",
              "email":"john.doe@example.com"
            }''';
        } else {
          return null;
        }
        break;
      default:
        return null;
    }
  }

  @override
  Future<LoginResponse> login({String username, String password}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'test') {
      return LoginResponse(
          userId: 'test', message: 'Login successful for user: $username');
    }

    return LoginResponse(success: false, message: 'Login unsuccesful');
  }

  @override
  Future<List<CurrentStory>> getCurrentStories() {
    final story = CurrentStory(
        id: '1',
        club: Club(
            logo: 'logo',
            clubName: 'DesignTab',
            id: '1',
            facAd: 'Prof. ABC',
            society: 'Technical Society',
            domain: 'desgintab.com'),
        event: null,
        assetType: 'image',
        createdAt: DateTime(2021, 1, 31),
        asset: 'assetUrl',
        description: 'Description');
    return Future.value(List<CurrentStory>.generate(10, (index) => story));
  }

  @override
  Future<List<ScheduleEvent>> fetchSchedule() {
    final scheduleEvent = ScheduleEvent(
        time: '4.30 PM',
        identifier: 'MA-3002',
        title: 'Computational Mathematics',
        contact: 'Prof. Nihar Patra');
    return Future.value(
        List<ScheduleEvent>.generate(6, (index) => scheduleEvent));
  }
}
