import 'package:dartz/dartz.dart';
import 'package:elaichi/core.dart';
import 'package:elaichi/datamodels.dart';
import 'package:elaichi/services.dart';
import 'package:stacked/stacked.dart';

/// FeedViewmodel
class FeedViewModel extends BaseViewModel {
  final _apiService = locator<Api>();
  Either<Failure, List<ScheduleEvent>> _scheduleEvents;
  Either<Failure, List<CurrentStory>> _currentStories;

  /// Returns the current stories.
  Either<Failure, List<CurrentStory>> get currentStories => _currentStories;

  /// Returns the schedule events.
  Either<Failure, List<ScheduleEvent>> get scheduleEvents => _scheduleEvents;

  /// Calls the required functions to initialise the view model.
  Future<void> initialise() async {
    setBusy(true);
    await Future.wait([fetchCurrentStories(), getSchedule()]);
    setBusy(false);
  }

  /// Fetches current stories from [Api].
  Future<void> fetchCurrentStories() async {
    await Task(_apiService.getCurrentStories)
        .attempt()
        .map((either) => either.leftMap((obj) => obj as Failure))
        .run()
        .then(_setCurrentStories);
  }

  void _setCurrentStories(Either<Failure, List<CurrentStory>> stories) {
    _currentStories = stories;
    notifyListeners();
  }

  /// Fetches schedule from [Api].
  Future<void> getSchedule() async {
    await Task(_apiService.fetchSchedule)
        .attempt()
        .map((either) => either.leftMap((obj) => obj as Failure))
        .run()
        .then(_setScheduleEvents);
  }

  void _setScheduleEvents(Either<Failure, List<ScheduleEvent>> events) {
    _scheduleEvents = events;
    notifyListeners();
  }
}
