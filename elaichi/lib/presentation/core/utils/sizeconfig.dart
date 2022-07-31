import 'package:flutter/material.dart';

///[Size Config] are used to set the size of the  elements in the app
class SizeConfig {
  late MediaQueryData _mediaQueryData;

  /// [screenWidth] is used to get the width of the screen
  static double? screenWidth;

  /// [screenHeight] is used to get the height of the screen
  static double? screenHeight;

  late double _safeAreaHorizontal;
  late double _safeAreaVertical;

  ///[safeBlockHorizontal] is used to get the safe horizontal block
  static double? safeBlockHorizontal;

  ///[safeBlockVertical] is used to get the safe vertical block
  static double? safeBlockVertical;

  /// to initialize the size config
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical) / 100;
  }
}
