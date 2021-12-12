import 'package:flutter/material.dart';

///Custom App Bar maintained through out the application
class CustomAppBar extends StatelessWidget {
  /// Default Constructor
  const CustomAppBar({
    Key? key,
    required this.text,
    this.leftTap,
    this.rightTap,
    this.leftButton,
    this.rightButton,
  }) : super(key: key);

  /// [text] contains the title of the page
  final String text;

  /// Callback function when left action button button is tapped
  final void Function()? leftTap;

  /// Callback function when right action  button is tapped
  final void Function()? rightTap;

  /// Icon on the Left side of the AppBar
  final IconData? leftButton;

  ///Icon on the Right Side of the AppBar
  final IconData? rightButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
      elevation: 0,
      centerTitle: true,
      leading: (leftButton != null)
          ? IconButton(
              onPressed: leftTap,
              icon: Icon(
                leftButton,
              ),
            )
          : Container(),
      actions: [
        if (rightButton != null)
          IconButton(
            onPressed: rightTap,
            icon: Icon(
              rightButton,
            ),
          )
        else
          Container(),
      ],
    );
  }
}
