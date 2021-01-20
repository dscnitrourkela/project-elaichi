import 'package:elaichi/datamodels/api_models.dart';

/// Defines the interface used by the API services.
abstract class Api {
  /// Provides interface for getting current stories.
  Future<List<CurrentStory>> getCurrentStories();

  /// Provides interface for getting schedule.
  Future<List<ScheduleEvent>> fetchSchedule();
}
