import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Array containing the bootom nav bar items.
List<BottomNavigationBarItem> navBarItems({
  required String profileImage,
  required bool isVerifiedUser,
}) =>
    <BottomNavigationBarItem>[
      /// The icon for Feed Page
      // BottomNavigationBarItem(
      //   label: 'Feed',
      //   icon: SvgPicture.asset(Strings.homeInactive),
      //   activeIcon: SvgPicture.asset(Strings.homeActive),
      // ),

      /// The icon for Browwse Page
      // BottomNavigationBarItem(
      //   label: 'Browse',
      //   icon: SvgPicture.asset(Strings.browseInactive),
      //   activeIcon: SvgPicture.asset(Strings.browseActive),
      // ),

      /// The icon for Zimbra Webmail Page
      if (isVerifiedUser)
        BottomNavigationBarItem(
          label: 'Zimbra',
          icon: SvgPicture.asset(Strings.mailInactive, height: SizeConfig.safeBlockHorizontal! * 5.27),
          activeIcon: SvgPicture.asset(Strings.mailInactive, height: SizeConfig.safeBlockHorizontal! * 5.27, color: AppColors.grey12),
        ),

      BottomNavigationBarItem(
        label: 'Fest',
        icon: SvgPicture.asset(
          Strings.festLogo,
          height: SizeConfig.safeBlockHorizontal! * 6.35,
          color: Colors.grey[400],
        ),
        activeIcon: SvgPicture.asset(
          Strings.festLogo,
          color: AppColors.grey12,
          height: SizeConfig.safeBlockHorizontal! * 6.35,
        ),
      ),

      /// The icon for Profile Page
      BottomNavigationBarItem(
        label: 'Profile',
        icon: ClipRRect(
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal! * 10,
          ),
          child: CachedNetworkImage(
            imageUrl: profileImage,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Icon(Icons.person),
            height: SizeConfig.safeBlockHorizontal! * 7.5,
            width: SizeConfig.safeBlockHorizontal! * 7.5,
          ),
        ),
        activeIcon: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                SizeConfig.safeBlockHorizontal! * 10,
              ),
              child: CachedNetworkImage(
                imageUrl: profileImage,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Icon(Icons.person),
                height: SizeConfig.safeBlockHorizontal! * 7,
                width: SizeConfig.safeBlockHorizontal! * 7,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppColors.grey12),
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockHorizontal! * 10,
                ),
              ),
              height: SizeConfig.safeBlockHorizontal! * 7.5,
              width: SizeConfig.safeBlockHorizontal! * 7.5,
            ),
          ],
        ),
      ),
    ];
