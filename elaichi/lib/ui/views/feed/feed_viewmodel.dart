import 'package:dartz/dartz.dart';
import 'package:elaichi/app/failure.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/services/api.dart';
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
  void initialise() async {
    setBusy(true);
    // Future.wait([fetchCurrentStories(), getSchedule()]);
    await fetchCurrentStories();
    getSchedule();
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
  void getSchedule() async {
    await Future.delayed(const Duration(seconds: 4));
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
