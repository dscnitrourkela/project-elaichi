import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Array containing the bootom nav bar items.
List<BottomNavigationBarItem> navBarItems = <BottomNavigationBarItem>[
  /// The icon for Feed Page
  BottomNavigationBarItem(
    label: 'Feed',
    icon: SvgPicture.asset(Strings.homeInactive),
    activeIcon: SvgPicture.asset(Strings.homeActive),
  ),

  /// The icon for Browwse Page
  BottomNavigationBarItem(
    label: 'Browse',
    icon: SvgPicture.asset(Strings.browseInactive),
    activeIcon: SvgPicture.asset(Strings.browseActive),
  ),

  BottomNavigationBarItem(
    label: 'Fest',
    icon: ClipRRect(
      borderRadius: BorderRadius.circular(
        SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
        fit: BoxFit.fill,
        placeholder: (context, url) => const Icon(Icons.person),
        height: SizeConfig.safeBlockHorizontal! * 7,
        width: SizeConfig.safeBlockHorizontal! * 7,
      ),
    ),
    activeIcon: DecoratedBox(
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
        child: CachedNetworkImage(
          imageUrl:
              'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
          fit: BoxFit.fill,
          placeholder: (context, url) => const Icon(Icons.person),
          height: SizeConfig.safeBlockHorizontal! * 6.75,
          width: SizeConfig.safeBlockHorizontal! * 6.75,
        ),
      ),
    ),
  ),

  /// The icon for Zimbra Webmail Page
  BottomNavigationBarItem(
    label: 'Zimbra',
    icon: SvgPicture.asset(Strings.mailInactive),
    activeIcon: SvgPicture.asset(Strings.mailActive),
  ),

  /// The icon for Profile Page
  BottomNavigationBarItem(
    label: 'Profile',
    icon: ClipRRect(
      borderRadius: BorderRadius.circular(
        SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
        fit: BoxFit.fill,
        placeholder: (context, url) => const Icon(Icons.person),
        height: SizeConfig.safeBlockHorizontal! * 7,
        width: SizeConfig.safeBlockHorizontal! * 7,
      ),
    ),
    activeIcon: DecoratedBox(
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
        child: CachedNetworkImage(
          imageUrl:
              'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
          fit: BoxFit.fill,
          placeholder: (context, url) => const Icon(Icons.person),
          height: SizeConfig.safeBlockHorizontal! * 6.75,
          width: SizeConfig.safeBlockHorizontal! * 6.75,
        ),
      ),
    ),
  ),
];
