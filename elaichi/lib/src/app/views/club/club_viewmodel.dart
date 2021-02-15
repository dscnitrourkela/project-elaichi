import 'package:dartz/dartz.dart';
import 'package:elaichi/app/failure.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/services/api.dart';
import 'package:stacked/stacked.dart';

/// ViewModel for Club details.
class ClubViewModel extends BaseViewModel {
  final _apiService = locator<Api>();
  Either<Failure, Club> _club;
  Either<Failure, List<CurrentStory>> _storiesArchive;

  /// Returns the object [Club] of current club
  Either<Failure, Club> get club => _club;

  /// Returns a [List<CurrentStory>] of current club
  Either<Failure, List<CurrentStory>> get storiesArchive => _storiesArchive;

  /// Calls the required functions to initialise the viewmodel
  Future<void> initialise(int clubId) async {
    setBusy(true);
    await Future.wait([fetchClub(clubId), fetchStoriesArchive(clubId)]);
    setBusy(false);
  }

  /// Fetch data for the corresponding club id.
  Future<void> fetchClub(int clubId) async {
    await Task(() => _apiService.fetchClub(clubId: clubId))
        .attempt()
        .map((either) => either.leftMap((obj) => obj as Failure))
        .run()
        .then(_setClub);
  }

  void _setClub(Either<Failure, Club> clubResponse) {
    _club = clubResponse;
    notifyListeners();
  }

  /// Fetches present and past stories of a given [clubId]
  Future<void> fetchStoriesArchive(int clubId) async {
    await Task(() => _apiService.getStoriesByField(clubId: clubId))
        .attempt()
        .map((either) => either.leftMap((obj) => obj as Failure))
        .run()
        .then(_setStoriesArchive);
  }

  void _setStoriesArchive(Either<Failure, List<CurrentStory>> stories) {
    _storiesArchive = stories;
    notifyListeners();
  }
}
