import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/core.dart';
import 'package:elaichi/src/generated/locale_keys.g.dart';
import 'package:elaichi/src/services/auth.dart';
import 'package:elaichi/src/services/graphql.dart';
import 'package:elaichi/src/ui/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'signup_view.dart';

/// ViewModel for [SignupView]
class SignupViewModel extends BaseViewModel {
  /// Input field that takes username
  StringInputField _usernameInputField;
  StringInputField _mobileInputField;

  /// Used by view to show error
  bool usernameErrorState = false;

  /// Signup button text
  String get buttonText => LocaleKeys.completeSignup.tr();

  final Logger _logger = getLogger('Signup view model');

  /// Initializer of this ViewModel, for InputFields
  void init(BuildContext context) {
    _usernameInputField = StringInputField(
        context: context,
        hint: LocaleKeys.username.tr(),
        onChangeFunction: (String value) {
          // TODO: Apply async validator for username check
          // Refer: https://stackoverflow.com/questions/52584520/flutter-firebase-validation-of-form-field-inputs
          usernameErrorState = false;
          if (value.length <= 4) {
            return 'Must be more than 4 letters';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        onSubmit: () {
          final username = _usernameInputField.controller.value.text;
          isUsernameAvailable(username).then((isAvailable) {
            if (isAvailable) {
              usernameErrorState = false;
            } else {
              usernameErrorState = true;
            }
            notifyListeners();
          });
        },
        isErrorState: () => usernameErrorState);
    _mobileInputField = StringInputField(
      context: context,
      hint: '${LocaleKeys.mobile.tr()} (${LocaleKeys.optional.tr()})',
      textInputAction: TextInputAction.done,
      onSubmit: signup,
    );
  }

  /// Returns UI component for rendering.
  Widget get usernameInputField => _usernameInputField.getUi();

  /// Returns UI component for rendering.
  Widget get mobileInputField => _mobileInputField.getUi();

  /// Check if username already exists
  Future<bool> isUsernameAvailable(String username) async {
    if (username == '') {
      return false;
    }
    final _graphql = locator<GraphQL>();
    try {
      final user = await _graphql.getUserByUsername(username: username);
      if (user == null) {
        return false;
        // return true;
      } else {
        return false;
      }
    } catch (gql_error) {
      _logger.e(gql_error.toString);
      locator<SnackbarService>().showSnackbar(message: 'Error: $gql_error');
      setError(true);
      return false;
    }
  }

  /// on submit signup function
  void signup() {
    final _auth = locator<Auth>();
    try {
      setBusy(true);
      _auth
          .updateUser(
              username: _usernameInputField.getText(),
              mobile: _mobileInputField.getText())
          .then((_) {
        locator<NavigationService>().clearStackAndShow(Routes.homeView);
      });
    } catch (error) {
      final snackbarService = locator<SnackbarService>();
      if (error is GraphQLException) {
        snackbarService.showSnackbar(
            title: 'Unexpected error', message: 'Error Code: ${error.code}');
      } else {
        snackbarService.showSnackbar(message: 'Unexpected error');
      }
    }
  }
}
