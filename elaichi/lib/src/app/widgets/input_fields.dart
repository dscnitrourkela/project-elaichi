import 'package:elaichi/app/config/measurements.dart';
import 'package:flutter/material.dart';
import 'package:elaichi/app/extensions.dart';

/// String input from user
///
/// Use in `ViewModel` for best operation.
class StringInputField {
  /// Constructor
  StringInputField(
      {@required this.context,
      this.onChangeFunction,
      this.hint,
      this.textInputAction = TextInputAction.done,
      this.onSubmit,
      this.isErrorState}) {
    isErrorState ??= () => false;
  }

  /// Form key
  final LabeledGlobalKey<FormState> _key =
      LabeledGlobalKey<FormState>('TextField key');

  /// Text that appearsas hint
  ///
  /// Not required but recommended
  final String hint;

  /// Build context for required for text styling.
  final BuildContext context;

  /// After every change this function s being called.
  final String Function(String) onChangeFunction;

  /// Controller for the input field.
  final TextEditingController controller = TextEditingController();

  /// Text input action, aka. completion button
  final TextInputAction textInputAction;

  /// OnSubmit action. Define only with the textInputAction as
  /// `TextInputAction.done`.
  final Function() onSubmit;

  /// Shows error decoration if true;
  bool Function() isErrorState;

  /// Returns UI, that can be used to in rendering.
  Widget getUi() {
    return _buildTextFormField();
  }

  /// Returns the value of current input field
  String getText() => controller.value.text;

  Widget _buildTextFormField() {
    return TextFormField(
      key: _key,
      controller: controller,
      textInputAction: textInputAction,
      validator: onChangeFunction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onEditingComplete: onSubmit,
      decoration: InputDecoration(
        enabledBorder: isErrorState()
            ? const OutlineInputBorder(
                borderRadius: Measurements.inputRadius,
                borderSide: Measurements.errorBorderSide,
              )
            : const OutlineInputBorder(
                borderRadius: Measurements.inputRadius,
                borderSide: Measurements.enabledBorderSide,
              ),
        errorBorder: const OutlineInputBorder(
          borderRadius: Measurements.inputRadius,
          borderSide: Measurements.errorBorderSide,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: Measurements.inputRadius,
          borderSide: Measurements.errorBorderSide,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: Measurements.inputRadius,
          borderSide: Measurements.focusedBorderSide,
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: Measurements.inputRadius,
          borderSide: Measurements.disabledBorderSide,
        ),
        labelText: hint,
        labelStyle: context.textTheme.subtitle1,
      ),
      style: context.textTheme.bodyText1,
    );
  }
}
