// ignore_for_file: avoid_unnecessary_containers, use_decorated_box
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/fest_calender.dart';
import 'package:elaichi/presentation/home/fest/widgets/header_widget.dart';
import 'package:elaichi/presentation/home/fest/widgets/high_priority_event_card.dart';
import 'package:elaichi/presentation/home/fest/widgets/low_priority_event_card.dart';
import 'package:elaichi/presentation/home/fest/widgets/speaker_event_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiver/iterables.dart';

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
    viewportFraction: 0.9,
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
    final format1 = DateFormat('MMM');
    final duration =
        '${format1.format(widget.fest.startDate!)} ${widget.fest.startDate!.day.toString().padLeft(2, '0')} - ${format1.format(widget.fest.endDate!)} ${widget.fest.endDate!.day.toString().padLeft(2, '0')} ${widget.fest.endDate!.year}';
    final funEventsPartedList =
        partition(widget.categorisedEvents['FUN']!, 3).toList();
    final exhibitionsPartedList =
        partition(widget.categorisedEvents['EXHIBITIONS']!, 3).toList();

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
              YellowFlatButton(text: 'Register Now!', onTapped: () {}),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints:
                  BoxConstraints(minHeight: SizeConfig.screenHeight! * 0.7),
              width: SizeConfig.screenWidth,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  HeaderWidget(
                    imageUrl: widget.fest.coverImg ?? Strings.placeholderImage,
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
                    top: 298,
                    left: 16,
                    right: 16,
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 208),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              style: interTextTheme.bodyText1!.copyWith(
                                color: AppColors.grey6.withOpacity(0.8),
                              ),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              thickness: 1,
              height: 1,
              color: Colors.white.withOpacity(0.2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: DurationDates(
                text: duration,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pro Shows',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 466,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => HighPriorityEventCard(
                        event: widget.categorisedEvents['PRO']![index],
                      ),
                      itemCount: widget.categorisedEvents['PRO']!.length,
                    ),
                  ),
                  const SizedBox(height: 86),
                  Text(
                    'Technical Events',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 466,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => HighPriorityEventCard(
                        event: widget.categorisedEvents['TECHNICAL']![index],
                      ),
                      itemCount: widget.categorisedEvents['TECHNICAL']!.length,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    'Fun Events',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 330,
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index1) {
                        return Column(
                          children: List.generate(
                            funEventsPartedList[index1].length,
                            (index2) => Column(
                              children: [
                                LowPriorityEventItem(
                                  event: funEventsPartedList[index1][index2],
                                ),
                                const SizedBox(height: 16)
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 24),
                      itemCount: funEventsPartedList.length,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    'Exhibitions',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 330,
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index1) {
                        return Column(
                          children: List.generate(
                            exhibitionsPartedList[index1].length,
                            (index2) => Column(
                              children: [
                                LowPriorityEventItem(
                                  event: exhibitionsPartedList[index1][index2],
                                ),
                                const SizedBox(height: 16)
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 24),
                      itemCount: exhibitionsPartedList.length,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    'Guest Lectures',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 394,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SpeakerEventCard(
                        event:
                            widget.categorisedEvents['GUEST-LECTURES ']![index],
                      ),
                      itemCount:
                          widget.categorisedEvents['GUEST-LECTURES ']!.length,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    'Workshops',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 394,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SpeakerEventCard(
                        event: widget.categorisedEvents['WORKSHOPS']![index],
                      ),
                      itemCount: widget.categorisedEvents['WORKSHOPS']!.length,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    'Our Schedule',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 16),
                  CalenderTabView(
                    tabController: _tabController,
                    calender: widget.calender,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 72),
          ],
        ),
      ),
    );
  }
}
