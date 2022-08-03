import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    required this.hintText,
    this.title,
    this.titleStyle,
    this.errorText,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.maxLength,
    this.maxLines,
    this.textInputType = TextInputType.name,
    this.enabled = true,
    this.prefixText,
    this.suffixText,
    this.suffixIcon,
    this.focusNode,
    this.onTap,
    this.readOnly,
    this.contentPadding,
    this.prefixTextFontWeight,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final String? title;
  final TextStyle? titleStyle;
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffixIcon;
  final String? errorText;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final EdgeInsets padding;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final bool? readOnly;
  final EdgeInsets? contentPadding;
  final FontWeight? prefixTextFontWeight;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            Text(
              title!,
              style: titleStyle ??
                  Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Theme.of(context).hintColor),
            ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            onChanged: onChanged,
            onTap: onTap,
            controller: controller,
            focusNode: focusNode,
            keyboardType: textInputType,
            maxLength: maxLength,
            readOnly: readOnly ?? false,
            maxLengthEnforcement:
                (maxLength == null) ? null : MaxLengthEnforcement.enforced,
            maxLines: maxLines,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w600,
                  // color: enabled ? null : Theme.of(context).,
                ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).disabledColor),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightBlue),
              ),
              contentPadding: contentPadding ?? const EdgeInsets.all(12),
              enabled: enabled,
              filled: true,
              fillColor: !enabled
                  ? Theme.of(context).cardColor
                  : errorText == null
                      ? Theme.of(context).scaffoldBackgroundColor
                      : AppColors.failureRedLight,
              prefixIcon: prefixText != null
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                      decoration: BoxDecoration(
                        // color: enabled ? AppColors.lite : AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        prefixText!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight:
                                  prefixTextFontWeight ?? FontWeight.w700,
                              color: AppColors.bodyText,
                            ),
                      ),
                    )
                  : null,
              suffixIcon: suffixText != null
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                      decoration: BoxDecoration(
                        // color: enabled ? AppColors.lite : AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        suffixText!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    )
                  : suffixIcon,
              errorText: errorText,
              hintText: hintText,
            ),
          )
        ],
      ),
    );
  }
}
