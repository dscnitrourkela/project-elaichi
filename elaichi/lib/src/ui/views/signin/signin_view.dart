import 'package:elaichi/core.dart';
import 'package:elaichi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'signin_viewmodel.dart';

/// Signin page.
class SigninView extends StatelessWidget {
  /// Constructor for [SigninView]
  const SigninView({Key? key}) : super(key: key);

  final String _googleLogoFileUri = 'assets/images/google_logo.svg';
  final String _plantLogoFileUri = 'assets/images/plants.png';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SigninViewModel>.reactive(
        viewModelBuilder: () => SigninViewModel(),
        builder: (BuildContext context, SigninViewModel model, Widget? child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              body: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxHeight > constraints.maxWidth) {
                  return _portraitView(constraints, model);
                } else {
                  return _landscapeView(constraints, model);
                }
              }),
            ),
          );
        });
  }

  Widget _portraitView(BoxConstraints constraints, SigninViewModel model) {
    return SizedBox(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoAppName(),
                Padding(
                  padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
                ),
                _plantImage(),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: constraints.maxHeight * 0.15),
                ),
                _googleButton(model),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _landscapeView(BoxConstraints constraints, SigninViewModel model) {
    return Row(
      children: [
        SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth / 2,
          child: Center(
            child: _plantImage(),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoAppName(),
              Padding(
                padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.2),
              ),
              _googleButton(model),
            ],
          ),
        ),
      ],
    );
  }

  Button _googleButton(SigninViewModel model) => Button(
        icon: SvgPicture.asset(_googleLogoFileUri),
        text: model.buttonText,
        onTapped: () {
          model.signIn();
        },
        isBusy: model.isBusy,
      );

  Widget _plantImage() => Image.asset(_plantLogoFileUri);
}
