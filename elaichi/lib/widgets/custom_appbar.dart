import 'package:flutter/material.dart';

///Custom App Bar maintained through out the application
AppBar customAppBar({
  required String text,
  required BuildContext context,
  void Function()? leftTap,
  void Function()? rightTap,
  IconData? leftButton,
  IconData? rightButton,
}) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text(
      text,
      style: Theme.of(context).textTheme.headline6,
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
