import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///The Browse Page
class BrowsePage extends StatelessWidget {
  /// Default constructor
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(title: 'Browse'),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;
  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM');
    // final imageUrl = Strings.eventExample;
    // final date = 'August 6';
    // final organiser = 'DSC NIT Rourkela';
    // final description =
    //     'A visual design workshop series on photoshop, illustrator and AR/VR';
    // final location = 'LA-117';
    // final title = 'Orientation 2020';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 368,
      height: 180,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: event.poster,
            height: 160,
            width: 110,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jsonDecode(event.name)['subHeading'].toString(),
                  style: interTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey3,
                    fontSize: 10,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  jsonDecode(event.name)['heading'].toString(),
                  style: interTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey2,
                    fontSize: 18,
                    height: 1.4,
                    letterSpacing: -0.02,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${format.format(event.startDate)} • ',
                  style: interTextTheme.bodySmall!.copyWith(
                    color: AppColors.grey2.withOpacity(0.6),
                    letterSpacing: 0.05,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 150,
                  child: Text(
                    jsonDecode(event.description)[0]['desc'].toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.grey2,
                          letterSpacing: 0.05,
                          fontSize: 12,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
