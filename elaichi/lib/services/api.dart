import 'package:elaichi/datamodels/api_models.dart';
import 'package:flutter/foundation.dart';

/// Defines the interface used by the API services.
abstract class Api {
  /// Provides interface for login functionality.
  /// The parameters [username] and [password] must be non-null.
  Future<LoginResponse> login(
      {@required String username, @required String password});

  /// Provides interface for getting user details.
  /// The parameter [userId] must be non null.
  Future<String> getUser(String userId, {int errorMode = 0});

  /// Provides interface for getting current stories.
  Future<List<CurrentStory>> getCurrentStories();

  /// Provides interface for getting schedule.
  Future<List<ScheduleEvent>> fetchSchedule();
}
