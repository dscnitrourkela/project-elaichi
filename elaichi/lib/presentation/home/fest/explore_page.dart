// ignore_for_file: avoid_unnecessary_containers, use_decorated_box

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/components/custom_carousel/custom_carousel.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/fest_calender.dart';
import 'package:elaichi/presentation/home/fest/widgets/fest_event_card.dart';
import 'package:elaichi/presentation/home/fest/widgets/header_widget.dart';
import 'package:elaichi/presentation/home/fest/widgets/sessions_card.dart';
import 'package:elaichi/presentation/home/fest/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';
// import 'package:package'

class ExplorePage extends StatefulWidget {
  ExplorePage({
    Key? key,
    required this.fest,
    required this.categorisedEvents,
    required this.calender,
  }) : super(key: key);

  final Org fest;

  final Map<String, List<Event>> categorisedEvents;

  final Map<String, List<Event>> calender;

  late final eventPageController = PageController(
    initialPage: 1,
    viewportFraction: 0.75,
    keepPage: false,
  );

  final speakerPageController = PageController(
    initialPage: 1,
    viewportFraction: 0.65,
    keepPage: false,
  );

  final sessionListController = PageController(
    viewportFraction: 0.9,
    keepPage: false,
  );

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  int currentEventIndex = 1;
  int currentSpeakerIndex = 1;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    widget.eventPageController.addListener(
      () {
        setState(() {
          currentEventIndex = widget.eventPageController.page!.floor();
          currentSpeakerIndex = widget.speakerPageController.page!.floor();
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 95,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(height: 1, thickness: 1, color: AppColors.grey7),
              const SizedBox(height: 13),
              YellowWideButton(text: 'Register Now!', onTapped: () {}),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.translucentButton,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.77,
              width: SizeConfig.screenWidth,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  HeaderWidget(
                    imageUrl: widget.fest.coverImg ??
                        'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
                    leadingWidget: Container(
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                        color: AppColors.translucentButton.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Back',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    trailingWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal! * 10,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.fest.logo,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Icon(Icons.circle),
                        height: 34,
                        width: 32,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 308,
                    left: 16,
                    right: 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: Container(
                          width: 338,
                          color: Colors.grey.withOpacity(0.07),
                          constraints: const BoxConstraints(minHeight: 258),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 30,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  widget.fest.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  widget.fest.description,
                                  style: robotoTextTheme.bodyText1!.copyWith(
                                    color: AppColors.grey6.withOpacity(0.6),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const DurationDates(
              text: 'Jan 03 - Jan 07 2023',
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 62),
            Text(
              'EXCITING EVENTS',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColors.festSubTitiles),
            ),
            const SizedBox(height: 16),
            Text(
              'Name of Event',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 7),
            Text(
              '03 Jan | 16:00 IST | 4 Members',
              style: robotoTextTheme.bodyText1!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 11),
            CustomCarousel(
              height: 500,
              width: 340,
              pageController: widget.eventPageController,
              itemCount: 3,
              itemBuilder: (context, index) => FestEventCard(
                currentIndex: currentEventIndex,
                index: index,
              ),
            ),
            const SizedBox(height: 70),
            Text(
              'FABULOUS SPEAKERS',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColors.festSubTitiles),
            ),
            const SizedBox(height: 16),
            CustomCarousel(
              height: 400,
              width: 400,
              itemCount: 3,
              pageController: widget.speakerPageController,
              itemBuilder: (context, selectedIndex) => SpeakerWidget(
                currentIndex: currentSpeakerIndex,
                index: selectedIndex,
              ),
            ),
            Text(
              'INSPIRING SESSIONS',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColors.festSubTitiles),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 234,
              width: 350,
              child: PageView.builder(
                clipBehavior: Clip.none,
                padEnds: false,
                itemBuilder: (context, index) {
                  final session = widget.categorisedEvents['FUN']![index];
                  return SessionsCard(
                    name: session.name,
                    startDate: session.startDate,
                  );
                },
                itemCount: widget.categorisedEvents['FUN']!.length,
                controller: widget.sessionListController,
              ),
            ),
            const SizedBox(height: 72),
            Text(
              'OUR CALENDER',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColors.festSubTitiles),
            ),
            const SizedBox(height: 16),
            CalenderTabView(
              tabController: _tabController,
              calender: widget.calender,
            ),
          ],
        ),
      ),
    );
  }
}
