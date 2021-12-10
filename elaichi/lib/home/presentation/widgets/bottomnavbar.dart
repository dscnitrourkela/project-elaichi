import 'package:flutter/material.dart';

/// The Bottom Navigation Bar that exists throughout the app.
class BottomNavBar extends StatelessWidget {
  ///Constructor for the BottomNavBar.
  const BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  ///The current index of the BottomNavBar.
  ///Shows which page is currently selected.
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        /// The icon for Feed Page
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),

        /// The icon for Browwse Page
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),

        /// The icon for Zimbra Webmail Page
        BottomNavigationBarItem(
          icon: Icon(
            Icons.mail_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),

        /// The icon for Profile Page
        const BottomNavigationBarItem(
          icon: CircleAvatar(),
        ),
      ],
    );
  }
}
