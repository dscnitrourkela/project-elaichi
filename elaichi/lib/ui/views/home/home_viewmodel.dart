import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/app/failure.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/datamodels/user.dart';
import 'package:elaichi/generated/locale_keys.g.dart';
import 'package:elaichi/services/feed_service.dart';
import 'package:stacked/stacked.dart';

/// ViewModel class for HomeView
class HomeViewModel extends IndexTrackingViewModel {
  String _title = LocaleKeys.welcome.tr();

  /// Returns [_title] followed by [_counter].
  String get title => _title;

  // Counter example using stacked.
  int _counter = 0;

  /// Returns [_counter] value.
  int get counter => _counter;

  Either<Failure, User> _user;

  /// Returns the value of [_user]. It can be either an instance of [Failure]
  /// or an instance of [User].
  ///
  /// Use following syntax to fold the value and work with it:
  /// ```dart
  ///   model.user.fold(
  ///     (failure) => Text(failure.toString()), // first argument is [Failure]
  ///     (user) => Text(user.toString())
  ///   );
  /// ```
  Either<Failure, User> get user => _user;

  final FeedService _feedService = locator<FeedService>();

  /// Called when '+' button is tapped on HomeView.
  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  void _setUser(Either<Failure, User> user) {
    _user = user;
    notifyListeners();
  }

  /// Fetches user info from API
  Future fetchUser() async {
    setBusy(true);
    await Task(_feedService.getUser)
        .attempt()
        .map((either) => either.leftMap((obj) => obj as Failure))
        .run()
        .then(_setUser);
    setBusy(false);
  }
}
