import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

/// This class is used to register the third party services with GetIt.
@module
abstract class ThirdPartyServicesModule {
  /// Registers [NavigationService] which handles navigation without context.
  /// ```dart
  /// //Navigation example
  /// final NavigationService _navigationService = locator<NavigationService>();
  /// ...
  /// _navigationService.navigateTo(Routes.HomeView);
  /// ...
  /// ```
  @lazySingleton
  NavigationService get navigationService;

  /// Registers [DialogService] which handles dialogs without context.
  /// Example:
  /// ```dart
  /// final DialogService _dialogService = locator<DialogService>();
  /// ...
  /// _dialogService.showDialog(title: "Awesome Title", description: "Awesome");
  /// ...
  /// ```
  @lazySingleton
  DialogService get dialogService;

  /// Registers [SnackbarService] which handles snackbars without context.
  /// Example:
  /// ```dart
  /// final SnackbarService _snackbarService = locator<SnackbarService>();
  /// ...
  /// _snackbarService.showSnackbar(
  /// title: "Awesome title", description:"Awesome");
  /// ...
  /// ```
  @lazySingleton
  SnackbarService get snackBarService;

  /// Registers [ThemeManager] from `stacked_themes` which handles themes
  /// without context.
  /// Example:
  /// ```dart
  ///  final ThemeManager _themeManager = locator<ThemeManager>();
  ///  ...
  ///  _themeManager.toggleDarkLightTheme();
  ///  ...
  /// ```
  @lazySingleton
  ThemeService get themeManager => ThemeService.getInstance();
}
