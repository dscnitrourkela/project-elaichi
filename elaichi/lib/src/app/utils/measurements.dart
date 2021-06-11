import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';

/// Measurements like padding, borderRadius, etc.
abstract class Measurements {
  /// Border radius used for button and input fields. Refer design
  static const BorderRadius inputRadius = BorderRadius.all(
    Radius.circular(6.0),
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide enabledBorderSide = BorderSide(
    width: 1.0,
    color: AppColors.enabledBorderColor,
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide disabledBorderSide = BorderSide(
    width: 1.0,
    color: AppColors.disabledBorderColor,
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide errorBorderSide = BorderSide(
    width: 1.0,
    color: AppColors.errorBorderColor,
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide focusedBorderSide = BorderSide(
    width: 1.0,
    color: AppColors.focusedBorderColor,
  );
}
