import 'package:elaichi/core.dart';
import 'package:elaichi/src/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Returns AppName in two line format.
class TwoLineAppName extends StatelessWidget {
  /// Constructor for TwoLineAppName.
  TwoLineAppName({Key? key}) : super(key: key);

  /// Return app's name, ie. Avenue
  final String _appNamePart1 = LocaleKeys.appName.tr();

  /// Return remaining part, ie. for NITR
  final String _appNamePart2 = LocaleKeys.forNitr.tr();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _appNamePart1,
          style: context.textTheme.headline6,
        ),
        Text(
          _appNamePart2,
          style: context.textTheme.subtitle1!.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

/// Returns AppName in one line format, ie. "Avenue"
class OneLineAppName extends StatelessWidget {
  /// Constructor for OneLineAppName
  OneLineAppName({Key? key}) : super(key: key);

  /// Return app's name, ie. Avenue
  final String _appNamePart1 = LocaleKeys.appName.tr();

  @override
  Widget build(BuildContext context) {
    return Text(
      _appNamePart1,
      style: context.textTheme.headline6,
    );
  }
}

/// Return combination of AppLogo and AppName, with (24 * scale) pixels gap in
/// between.
class LogoAppName extends StatelessWidget {
  /// Constructor for LogoAppName.
  const LogoAppName({this.scale = 1.0, Key? key}) : super(key: key);

  /// Scale of logo and gap. Text size is constant.
  final double scale;

  final String _avenueLogoFileUri = 'assets/images/avenue_logo.png';
  final String _widgetNameTag = 'LogoAppName';

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _widgetNameTag,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            _avenueLogoFileUri,
          ),
          Padding(
            padding: EdgeInsets.all(8.0 * scale),
          ),
          OneLineAppName()
        ],
      ),
    );
  }
}
