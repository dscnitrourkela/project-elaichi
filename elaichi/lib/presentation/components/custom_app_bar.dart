import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';

///Custom App Bar maintained through out the application
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  /// Constrcutor for CustomAppBar.
  const CustomAppBar({
    Key? key,
    required this.title,
    this.leftTap,
    this.rightTap,
    this.leftButton,
    this.rightButton,
  }) : super(key: key);

  /// Title of the AppBar
  final String title;

  /// Leading Icon onTap function of the AppBar.
  final void Function()? leftTap;

  /// Trailing Icon onTap function of the AppBar.
  final void Function()? rightTap;

  /// Leading Icon of the AppBar.
  final IconData? leftButton;

  /// Trailing Icon of the AppBar.
  final IconData? rightButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      elevation: 1,
      centerTitle: true,
      leading: (leftButton != null)
          ? IconButton(
              onPressed: leftTap,
              icon: Icon(
                leftButton,
                color: AppColors.darkBottomNav,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
