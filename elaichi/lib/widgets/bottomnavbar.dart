import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// The Bottom Navigation Bar that exists throughout the app.
class BottomNavBar extends StatelessWidget {
  ///Constructor for the BottomNavBar.
  BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  ///The current index of the BottomNavBar.
  ///Shows which page is currently selected.
  final int currentIndex;

  ///The list of icons that the Bottom Navigation Bar can navigate to.
  final List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    /// The icon for Feed Page
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.home,
      ),
    ),

    /// The icon for Zimbra Webmail Page
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.mailBulk,
      ),
    ),

    /// The icon for Profile Page
    const BottomNavigationBarItem(icon: CircleAvatar()),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
