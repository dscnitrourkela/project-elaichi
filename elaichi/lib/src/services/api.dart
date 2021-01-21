import 'package:elaichi/datamodels.dart';

/// Defines the interface used by the API services.
abstract class Api {
  /// Provides interface for getting current stories.
  Future<List<CurrentStory>> getCurrentStories();

  /// Provides interface for getting schedule.
  Future<List<ScheduleEvent>> fetchSchedule();

  /// Provides interface for getting club info for a club.
  /// Corresponding [clubId] should be passed to fetch data for that club.
  Future<Club> fetchClub({int clubId});

  /// Provides interface for getting club stories archive.
  /// [clubId] is passed to storiesByField to get club wise stories.
  Future<List<CurrentStory>> getStoriesByField({int clubId});
}
