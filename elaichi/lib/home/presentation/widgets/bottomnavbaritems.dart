import 'package:elaichi/auth/domain/datamodel/user_model.dart';
import 'package:flutter/material.dart';

///Array containing the bootom nav bar items.
List<BottomNavigationBarItem> navBarItems = <BottomNavigationBarItem>[
  /// The icon for Feed Page
  const BottomNavigationBarItem(
    label: 'Feed',
    icon: Icon(
      Icons.home_rounded,
    ),
  ),

  /// The icon for Browwse Page
  const BottomNavigationBarItem(
    label: 'Browse',
    icon: Icon(
      Icons.dashboard_rounded,
    ),
  ),

  /// The icon for Zimbra Webmail Page
  const BottomNavigationBarItem(
    label: 'Zimbra',
    icon: Icon(
      Icons.email_rounded,
    ),
  ),

  /// The icon for Profile Page
  BottomNavigationBarItem(
    label: 'Profile',
    icon: CircleAvatar(
      child: Image.network(
        UserData.instance().getUser!.photoURL.toString(),
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
      ),
    ),
  ),
];
