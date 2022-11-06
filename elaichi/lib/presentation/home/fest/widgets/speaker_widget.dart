// ignore_for_file: avoid_unnecessary_containers, use_decorated_box

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:flutter/material.dart';

class SpeakerWidget extends StatelessWidget {
  const SpeakerWidget({
    Key? key,
    required this.currentIndex,
    required this.index,
  }) : super(key: key);

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            Text(
              'Name of Speaker',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Designation of Person',
              style: interTextTheme.bodyText1!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 24),
            Container(
              width: 240,
              height: 240,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const DurationDates(
              text: 'Jan 03 | 12:00 Noon',
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
        if (currentIndex != index)
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
      ],
    );
  }
}

class SpeakerInfo extends StatelessWidget {
  const SpeakerInfo({
    Key? key,
    required this.imageUrl,
    this.height = 34,
    this.width = 32,
    required this.name,
    this.fontSize = 17,
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final double width;
  final String name;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Icon(Icons.circle),
            height: height,
            width: width,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          name,
          style: interTextTheme.bodyText1!.copyWith(
            color: AppColors.grey8,
            fontSize: fontSize,
            height: 1.34,
          ),
        ),
      ],
    );
  }
}
