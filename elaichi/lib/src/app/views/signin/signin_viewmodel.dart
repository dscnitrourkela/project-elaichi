import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/logger.dart';
import 'package:elaichi/app/router.gr.dart';
import 'package:elaichi/generated/locale_keys.g.dart';
import 'package:elaichi/services/auth.dart';
import 'package:elaichi/ui/views/signin/signin_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

/// ViewModel for [SigninView]
class SigninViewModel extends BaseViewModel {
  final Auth _auth = locator<Auth>();
  final Logger _logger = getLogger('Login View Model');

  /// Return text to write on the button
  String get buttonText => LocaleKeys.signInWithGoogle.tr();

  /// Sign in user
  void signIn() async {
    try {
      setBusy(true);
      await _auth.signIn();
      if (_auth.user.username == null) {
        await locator<NavigationService>().navigateTo(Routes.signupView);
      } else {
        await locator<NavigationService>().navigateTo(Routes.startupView);
      }
    } catch (exception) {
      _logger.e(exception);
      locator<SnackbarService>().showSnackbar(message: exception.toString());
      setError('Exception');
    } finally {
      setBusy(false);
    }
  }
}
