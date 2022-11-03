// ignore_for_file: avoid_unnecessary_containers, use_decorated_box

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/components/custom_carousel/custom_carousel.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/header_widget.dart';
import 'package:flutter/material.dart';
// import 'package:package'

class ExplorePage extends StatefulWidget {
  ExplorePage({Key? key}) : super(key: key);

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
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.77,
              width: SizeConfig.screenWidth,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  HeaderWidget(
                    imageUrl:
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
                        imageUrl:
                            Splash.instance().getUser!.photoURL.toString(),
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
                          height: 258,
                          color: Colors.grey.withOpacity(0.07),
                          width: 338,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 30,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'HackNITR 4.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Pellentesque eu tortor pulvinar nulla massa morbi ut volutpat, non. Vitae ullamcorper fermentum, sem convallis. Etiam ipsum sollicitudin enim ullamcorper. Egestas enim, nec amet, vitae libero condimentum libero urna. Arcu rhoncus, dictum diam neque.',
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
              itemBuilder: (context, index) {
                if (index == currentEventIndex) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(currentEventIndex - index.toDouble()),
                    child: EventCard(
                      currentIndex: currentEventIndex,
                      index: index,
                    ),
                  );
                } else if (index == currentEventIndex + 1) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(currentEventIndex - index.toDouble()),
                    child: EventCard(
                      currentIndex: currentEventIndex,
                      index: index,
                    ),
                  );
                } else {
                  return EventCard(
                    currentIndex: currentEventIndex,
                    index: index,
                  );
                }
              },
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
                itemBuilder: (context, index) => const SessionsCard(),
                itemCount: 3,
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
            CalenderTabView(tabController: _tabController),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

class CalenderTabView extends StatelessWidget {
  const CalenderTabView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: TabBar(
            unselectedLabelStyle: robotoTextTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.grey11,
            ),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            padding: const EdgeInsets.only(bottom: 8),
            // isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  '03 Jan',
                  style: robotoTextTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '04 Jan',
                  style: robotoTextTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '05 Jan',
                  style: robotoTextTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 519,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: const [
                    CalenderItem(session: false),
                    CalenderItem(session: true),
                  ],
                ),
                ListView(
                  children: const [
                    CalenderItem(session: false),
                    CalenderItem(session: false),
                  ],
                ),
                ListView(
                  children: const [
                    CalenderItem(session: false),
                    CalenderItem(session: true),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CalenderItem extends StatelessWidget {
  const CalenderItem({
    Key? key,
    required this.session,
  }) : super(key: key);

  final bool session;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: session ? 97 : 67,
      width: 326,
      decoration: BoxDecoration(
        color: AppColors.grey9.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Competition',
                style: robotoTextTheme.bodyText1!.copyWith(
                  color: session ? AppColors.teal : AppColors.yellowButton,
                  fontSize: 11,
                  letterSpacing: 0.07,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Track Event 1',
                style: robotoTextTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (session) const SizedBox(height: 4),
              if (session)
                const SpeakerInfo(
                  imageUrl:
                      'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
                  name: 'Name of Speaker',
                  fontSize: 12,
                  height: 24,
                  width: 24,
                )
            ],
          ),
          Text(
            '12:00 - 12:00',
            style: robotoTextTheme.overline!.copyWith(
              color: AppColors.grey10,
            ),
          )
        ],
      ),
    );
  }
}

class SessionsCard extends StatelessWidget {
  const SessionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 234,
      width: 296,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey6.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Koi bhi tadga sa naam session ka',
            style: robotoTextTheme.bodyText1!
                .copyWith(fontSize: 40, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const SpeakerInfo(
            imageUrl:
                'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
            name: 'Name of Speaker',
          ),
          const SizedBox(height: 16),
          const DurationDates(
            text: 'Jan 03 | 12:00 Noon',
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          YellowTextButton(
            mainAxisAlignment: MainAxisAlignment.start,
            onPressed: () {},
            text: 'Mark In Calender',
          )
        ],
      ),
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
          style: robotoTextTheme.bodyText1!.copyWith(
            color: AppColors.grey8,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}

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
              style: robotoTextTheme.bodyText1!.copyWith(color: Colors.white),
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

class EventCard extends StatelessWidget {
  const EventCard({
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
