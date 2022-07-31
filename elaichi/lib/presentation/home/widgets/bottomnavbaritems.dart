import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

///Array containing the bootom nav bar items.
List<BottomNavigationBarItem> navBarItems = <BottomNavigationBarItem>[
  /// The icon for Feed Page
  const BottomNavigationBarItem(
    label: 'Feed',
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(
      Icons.home_rounded,
    ),
  ),

  /// The icon for Browwse Page
  const BottomNavigationBarItem(
    label: 'Browse',
    icon: Icon(
      Icons.dashboard_outlined,
    ),
    activeIcon: Icon(
      Icons.dashboard_rounded,
    ),
  ),

  /// The icon for Zimbra Webmail Page
  const BottomNavigationBarItem(
    label: 'Zimbra',
    icon: Icon(
      Icons.email_outlined,
    ),
    activeIcon: Icon(
      Icons.email_rounded,
    ),
  ),

  /// The icon for Profile Page
  BottomNavigationBarItem(
    label: 'Profile',
    icon: ClipRRect(
      borderRadius: BorderRadius.circular(
        SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: Image.network(
        Splash.instance().getUser!.photoURL.toString(),
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
        height: SizeConfig.safeBlockHorizontal! * 10,
        width: SizeConfig.safeBlockHorizontal! * 10,
      ),
    ),
    activeIcon: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(
          SizeConfig.safeBlockHorizontal! * 10,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          SizeConfig.safeBlockHorizontal! * 10,
        ),
        child: Image.network(
          Splash.instance().getUser!.photoURL.toString(),
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.person),
          height: SizeConfig.safeBlockHorizontal! * 9.75,
          width: SizeConfig.safeBlockHorizontal! * 9.75,
        ),
      ),
    ),
  ),
];
