import 'package:flutter/material.dart';
import 'package:elaichi/app/extensions.dart';

/// Themed appbar widget for the app.
class ElaichiAppbar extends StatelessWidget with PreferredSizeWidget {
  /// Constructor for ElaichiAppbar
  const ElaichiAppbar(
      {this.title,
      this.backgroundColor,
      this.titleColor,
      this.elevation = 0.0,
      this.centerTitle = true,
      this.appbarHeight = kToolbarHeight});

  /// Title to show in the appbar.
  final String title;

  /// Background color of the appbar.
  final Color backgroundColor;

  /// Font color of the title of the appbar.
  final Color titleColor;

  /// Height of the appbar.
  final double appbarHeight;

  /// Whether the title should be centered. Default value is true.
  final bool centerTitle;

  /// Elevation of the appbar. Default elevation is 0.
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: context.textTheme.headline6.copyWith(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.02,
            height: 1.21,
            fontSize: 22.0),
      ),
      toolbarHeight: appbarHeight,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      elevation: elevation,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarHeight);
}
