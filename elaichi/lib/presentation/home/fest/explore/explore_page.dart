// ignore_for_file: avoid_unnecessary_containers, use_decorated_box
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/data/remote/graphql/graphql_service.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/event_type_map.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/home/fest/explore/cubit/registration_cubit.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/fest_calender.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/high_priority_event_card.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/low_priority_event_card.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/registration.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/speaker_event_card.dart';
import 'package:elaichi/presentation/home/fest/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/iterables.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
    required this.fest,
    required this.events,
  });

  final Org fest;

  final Map<String, Map<String, List<Event>>> events;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final RegistrationCubit _cubit;

  int currentEventIndex = 1;
  int currentSpeakerIndex = 1;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _cubit = RegistrationCubit(
      eventRepository: context.read<EventRepository>(),
      userRepository: context.read<UserRepository>(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.events.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('Uh oh! Could not fetch the events'),
        ),
      );
    }
    final duration = context
        .read<FestBloc>()
        .durationString(widget.fest.startDate, widget.fest.endDate);
    final categorisedEvents = widget.events['categorisedEvents'];
    final calender = widget.events['calender'];

    return Scaffold(
      bottomNavigationBar: !context.read<FestBloc>().isRegistered()
          ? RegisterBottomBar(
              child: YellowFlatButton(
                text: 'Register Now!',
                onTapped: () => launchUrlString(
                  "https://inno.nitrkl.in/",
                  mode: LaunchMode.externalApplication,
                ),
              ),
            )
          : null,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 620,
              width: SizeConfig.screenWidth,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  HeaderWidget(
                    imageUrl: widget.fest.coverImg ?? Strings.placeholderImage,
                    leadingWidget: const CustomBackButton(),
                    trailingWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal! * 10,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.fest.logo,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Icon(Icons.circle),
                        height: 34,
                        width: 36,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 382,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 48,
                            child: Text(
                              widget.fest.name,
                              style: interTextTheme.displayLarge,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 154,
                            child: Text(
                              widget.fest.description,
                              style: interTextTheme.bodyLarge!.copyWith(
                                color: AppColors.grey6.withOpacity(0.8),
                              ),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Divider(
              indent: 16,
              endIndent: 16,
              thickness: 1,
              height: 1,
              color: Colors.white.withOpacity(0.2),
            ),
            const SizedBox(height: 24),
            if (duration != '')
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                height: 28,
                width: 237,
                child: DurationDates(
                  iconSize: 18,
                  text: duration,
                  style: interTextTheme.bodySmall!.copyWith(
                    height: 1.05,
                    fontSize: 20,
                  ),
                ),
              ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventTypeMapping[categorisedEvents!.keys.toList()[0]]!,
                        style: interTextTheme.displayMedium,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.allEvents,
                          arguments: {'events': widget.events, 'index': 2},
                        ),
                        child: Text(
                          'View More',
                          style: interTextTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            height: 1.21,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  HighPriorityEventList(
                    allEvents:
                        categorisedEvents[categorisedEvents.keys.toList()[0]]!,
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventTypeMapping[categorisedEvents.keys.toList()[1]]!,
                        style: interTextTheme.displayMedium,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.allEvents,
                          arguments: {'events': widget.events, 'index': 1},
                        ),
                        child: Text(
                          'View More',
                          style: interTextTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            height: 1.21,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  HighPriorityEventList(
                    allEvents:
                        categorisedEvents[categorisedEvents.keys.toList()[1]]!,
                  ),
                  const SizedBox(height: 80),
                  if (categorisedEvents['GUEST-LECTURES']!.isNotEmpty) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          eventTypeMapping[categorisedEvents.keys.toList()[2]]!,
                          style: interTextTheme.displayMedium,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouter.allEvents,
                            arguments: {'events': widget.events, 'index': 3},
                          ),
                          child: Text(
                            'View More',
                            style: interTextTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              height: 1.21,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SpeakerEventList(
                      events: categorisedEvents['GUEST-LECTURES'] ?? [],
                    ),
                    const SizedBox(height: 80),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventTypeMapping[categorisedEvents.keys.toList()[3]]!,
                        style: interTextTheme.displayMedium,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.allEvents,
                          arguments: {'events': widget.events, 'index': 4},
                        ),
                        child: Text(
                          'View More',
                          style: interTextTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            height: 1.21,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  LowPriorityEventsList(
                    allEvents:
                        categorisedEvents[categorisedEvents.keys.toList()[3]]!,
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventTypeMapping[categorisedEvents.keys.toList()[4]]!,
                        style: interTextTheme.displayMedium,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.allEvents,
                          arguments: {'events': widget.events, 'index': 5},
                        ),
                        child: Text(
                          'View More',
                          style: interTextTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            height: 1.21,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  LowPriorityEventsList(
                    allEvents:
                        categorisedEvents[categorisedEvents.keys.toList()[4]]!,
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventTypeMapping[categorisedEvents.keys.toList()[5]]!,
                        style: interTextTheme.displayMedium,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.allEvents,
                          arguments: {'events': widget.events, 'index': 6},
                        ),
                        child: Text(
                          'View More',
                          style: interTextTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            height: 1.21,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  LowPriorityEventsList(
                    allEvents:
                        categorisedEvents[categorisedEvents.keys.toList()[5]]!,
                  ),
                  const SizedBox(height: 80),
                  if (categorisedEvents['OTHER']!.isNotEmpty) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          eventTypeMapping[categorisedEvents.keys.toList()[6]]!,
                          style: interTextTheme.displayMedium,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouter.allEvents,
                            arguments: {'events': widget.events, 'index': 7},
                          ),
                          child: Text(
                            'View More',
                            style: interTextTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              height: 1.21,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    LowPriorityEventsList(
                      allEvents: categorisedEvents[
                          categorisedEvents.keys.toList()[6]]!,
                    ),
                    const SizedBox(height: 80),
                  ],
                  Text(
                    'Our Schedule',
                    style: interTextTheme.displayMedium,
                  ),
                  const SizedBox(height: 24),
                  CalenderTabView(
                    tabController: _tabController,
                    calender: calender!,
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

class SpeakerEventList extends StatelessWidget {
  const SpeakerEventList({
    super.key,
    this.events = const [],
  });

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 358,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SpeakerEventCard(
          event: events[index],
        ),
        itemCount: events.length,
      ),
    );
  }
}

class LowPriorityEventsList extends StatelessWidget {
  const LowPriorityEventsList({
    super.key,
    required this.allEvents,
  });

  final List<Event> allEvents;

  @override
  Widget build(BuildContext context) {
    if (allEvents.isEmpty) {
      return const SizedBox();
    }
    final events = <Event>[];
    for (final event in allEvents) {
      if (event.status == StatusType.ACTIVE) {
        events.add(event);
      }
    }
    final partedList = partition(events, 3).toList();
    final colLength = events.length > 3 ? 3 : events.length;
    return SizedBox(
      height: 110 * colLength.toDouble(),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index1) {
          return Column(
            children: List.generate(
              partedList[index1].length,
              (index2) => Column(
                children: [
                  LowPriorityEventItem(
                    event: partedList[index1][index2],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 24),
        itemCount: partedList.length,
      ),
    );
  }
}

class HighPriorityEventList extends StatelessWidget {
  const HighPriorityEventList({
    super.key,
    required this.allEvents,
  });

  final List<Event> allEvents;

  @override
  Widget build(BuildContext context) {
    if (allEvents.isEmpty) {
      return const SizedBox();
    }
    final events = <Event>[];
    for (final event in allEvents) {
      if (event.status == StatusType.ACTIVE) {
        events.add(event);
      }
    }
    return SizedBox(
      height: 466,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HighPriorityEventCard(
          event: events[index],
        ),
        itemCount: events.length,
      ),
    );
  }
}
