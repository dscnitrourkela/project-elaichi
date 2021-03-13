import 'package:elaichi/src/app/extensions.dart';
import 'package:elaichi/src/ui/widgets/app_name.dart';
import 'package:elaichi/src/ui/widgets/buttons.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';

/// Signup page
///
/// Designed as complete screen page
class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      onModelReady: (SignupViewModel model) => model.init(context),
      builder: (BuildContext context, SignupViewModel model, Widget child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxHeight > constraints.maxWidth) {
                return _portraitView(context, constraints, model);
              } else {
                return _horizontalView(context, constraints, model);
              }
            }),
          ),
        );
      },
    );
  }

  Widget _portraitView(
      BuildContext context, BoxConstraints constraints, SignupViewModel model) {
    return SizedBox(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            LogoAppName(scale: 1.5),
            Padding(
              padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
            ),
            _form(context, constraints, model),
          ],
        ),
      ),
    );
  }

  Widget _horizontalView(
      BuildContext context, BoxConstraints constraints, SignupViewModel model) {
    return Row(
      children: [
        SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth / 2,
          child: Center(
            child: LogoAppName(scale: 1.5),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth / 2,
          child: Center(
            child: ListView(
                shrinkWrap: true,
                children: [_form(context, constraints, model)]),
          ),
        ),
      ],
    );
  }

  Widget _form(
      BuildContext context, BoxConstraints constraints, SignupViewModel model) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            model.usernameInputField,
            _usernameErrorBuilder(context, model),
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            model.mobileInputField,
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Button(
              text: model.buttonText,
              onTapped: () {
                model.signup();
              },
              isBusy: model.isBusy,
            )
          ],
        ),
      ),
    );
  }

  Widget _usernameErrorBuilder(BuildContext context, SignupViewModel model) {
    if (model.usernameErrorState) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Username already taken',
          style: context.textTheme.overline
              .copyWith(color: AppColors.errorBorderColor),
        ),
      );
    } else {
      return Container(
        width: 1.0,
      );
    }
  }
}
