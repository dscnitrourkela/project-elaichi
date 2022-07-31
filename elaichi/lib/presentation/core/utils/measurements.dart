import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';

/// Measurements like padding, borderRadius, etc.
abstract class Measurements {
  /// Border radius used for button and input fields. Refer design
  static const BorderRadius inputRadius = BorderRadius.all(
    Radius.circular(6),
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide enabledBorderSide = BorderSide(
    color: AppColors.enabledBorderColor,
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide disabledBorderSide = BorderSide(
    color: AppColors.disabledBorderColor,
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide errorBorderSide = BorderSide(
    color: AppColors.errorBorderColor,
  );

  /// Border side used for button and input fields. Refer design
  static const BorderSide focusedBorderSide = BorderSide(
    color: AppColors.focusedBorderColor,
  );
}
