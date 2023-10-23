import 'dart:developer';
import 'dart:math' as math;

import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Toast Mode enums.
// ignore: constant_identifier_names
enum ToastMode { Success, Error, Info, Warn }

class _Pair<F, S> {
  _Pair({
    required this.first,
    required this.second,
  });
  F first;
  S second;
}

class ToastUtil {
  // ignore: prefer_constructors_over_static_methods
  static ToastUtil getInstance() {
    _instance ??= ToastUtil();
    _toast ??= FToast();
    _contextStack ??= <_Pair<String, BuildContext>>[];
    return _instance!;
  }

  static FToast? _toast;
  static ToastUtil? _instance;
  static List<_Pair<String, BuildContext>>? _contextStack;
  late Widget _icon;
  late TextTheme _textTheme;
  late Color _foregroundColor;
  late Color _backgroundColor;

  /// Get the latest context in the _contextStack.
  BuildContext get _context {
    return _contextStack!.last.second;
  }

  /// Add context to _contextStack
  void add(String name, BuildContext context) {
    _contextStack!.add(
      _Pair<String, BuildContext>(
        first: name,
        second: context,
      ),
    );
    _textTheme = interTextTheme;
    _updateContext();
  }

  /// remove context from _contextStack
  void remove(String name) {
    // ignore: omit_local_variable_types
    for (final _Pair<String, BuildContext> element in _contextStack!) {
      if (element.first == name) {
        _contextStack!.remove(element);
        break;
      }
    }
    _updateContext();
  }

  /// Used to assign the context of latest route to the ToastUtility.
  void _updateContext() {
    if (_contextStack?.isEmpty ?? true) return;
    _toast!.init(_context);

    log('latest context is of:- ${_contextStack!.last.first}');
  }

  void setToastConf(ToastMode mode) {
    switch (mode) {
      case ToastMode.Success:
        _foregroundColor = AppColors.successGreen;
        _backgroundColor = AppColors.successGreenLight;
        _icon = Icon(
          Icons.check_circle_rounded,
          color: _foregroundColor,
        );
        break;
      case ToastMode.Error:
        _foregroundColor = AppColors.failureRed;
        _backgroundColor = AppColors.failureRedLight;
        _icon = Stack(
          children: <Widget>[
            Icon(
              Icons.circle,
              color: _foregroundColor,
            ),
            const Positioned(
              top: 4,
              left: 4,
              child: Icon(
                Icons.clear,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        );
        break;
      case ToastMode.Info:
        _foregroundColor = Colors.blue;
        _backgroundColor = AppColors.lightScaffoldBackground;
        _icon = Icon(
          Icons.info_rounded,
          color: _foregroundColor,
        );
        break;
      case ToastMode.Warn:
        _foregroundColor = AppColors.yellow;
        _backgroundColor = AppColors.yellowLight;
        _icon = Transform.rotate(
          angle: 180 * math.pi / 180,
          child: Icon(
            Icons.info_rounded,
            color: _foregroundColor,
          ),
        );
        break;
    }
  }

  void showToast({
    required ToastMode mode,
    String? title,
    String? description,
    ToastGravity? toastGravity,
    Toast? toastLength,
  }) {
    setToastConf(mode);
    final _content = <Widget>[];
    if (title != null) {
      _content.add(
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: _textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    if (description != null) {
      _content.add(
        Text(
          description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: false,
          style: _textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.bodyText,
          ),
        ),
      );
    }
    if (_content.length == 2) {
      _content.insert(
        1,
        const SizedBox(
          height: 4,
        ),
      );
    }
    _toast!.showToast(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _foregroundColor,
                width: 4,
              ),
            ),
            color: _backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _icon,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _content,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      gravity: toastGravity,
      toastDuration: toastLength == Toast.LENGTH_LONG
          ? const Duration(seconds: 5)
          : const Duration(seconds: 2),
    );
  }
}
