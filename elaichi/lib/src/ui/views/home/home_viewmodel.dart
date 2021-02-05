import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/src/generated/locale_keys.g.dart';
import 'package:stacked/stacked.dart';

/// ViewModel class for HomeView
class HomeViewModel extends IndexTrackingViewModel {
  final String _title = LocaleKeys.welcome.tr();

  /// Returns welcome message.
  String get title => _title;
}
