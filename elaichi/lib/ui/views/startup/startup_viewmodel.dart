import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

/// ViewModel class for [HomeView].
class StartupViewModel extends BaseViewModel {
  String _title = "Click on the button below to view the home page";

  /// Returns [_title] value.
  String get title => _title;

  final NavigationService _navigationService = locator<NavigationService>();

  /// Navigates to [HomeView]
  Future navigateToHome() async {
    _navigationService.navigateTo(Routes.homeView);
  }
}
