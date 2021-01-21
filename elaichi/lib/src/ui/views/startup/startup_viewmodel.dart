import 'package:elaichi/core.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

/// ViewModel class for HomeView.
class StartupViewModel extends BaseViewModel {
  /// [Logger] for [StartupViewModel].
  final Logger log = getLogger('StartupViewModel');
  final String _title = 'Click on the forward button to view the home page';

  final ThemeService _themeService = locator<ThemeService>();

  /// Returns [_title] value.
  String get title => _title;

  final NavigationService _navigationService = locator<NavigationService>();

  /// Navigates to HomeView.
  Future navigateToHome() async {
    log.i('Navigate to Home');
    await _navigationService.navigateTo(Routes.homeView);
  }

 /// Navigate to ClubView.
  Future navigateToClubPage() async {
    log.i('Navigate to Clubs page');
    await _navigationService.navigateTo(Routes.clubView);
  }

  /// Toggles between light and dark themes.
  void changeTheme() {
    _themeService.toggleDarkLightTheme();
    log.i('Changed theme to ${_themeService.isDarkMode ? 'dark' : 'light'}');
  }
}
