// ignore_for_file: use_decorated_box, avoid_unnecessary_containers

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class FestEventCard extends StatelessWidget {
  const FestEventCard({
    Key? key,
    required this.currentIndex,
    required this.index,
  }) : super(key: key);

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (currentIndex == index)
          Container(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                ),
              ),
            ),
          ),
        Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 15,
                    blurRadius: 15,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://res.cloudinary.com/donmjeufi/image/upload/v1666964515/Innovision%202k22/Event%20Posters/Technical%20Events/deathrace_thpjax.jpg',
                  height: 318,
                  width: SizeConfig.screenWidth! * 0.72,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              r'1st Prize: $800  |  2nd Prize: $50',
              style: robotoTextTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.captionRed,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Pellentesque eu tortor pulvinar nulla massa morbi ut volutpat, non. Vitae ullamcorper fermentum, sem convallis. Lorem ipsum.',
              style: robotoTextTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w200,
                color: AppColors.grey6.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey7,
            ),
            YellowTextButton(
              mainAxisAlignment: MainAxisAlignment.center,
              onPressed: () {},
              text: 'Register for Event',
            )
          ],
        ),
        if (currentIndex != index)
          Container(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
