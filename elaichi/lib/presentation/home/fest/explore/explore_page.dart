// ignore_for_file: avoid_unnecessary_containers, use_decorated_box
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
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

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    Key? key,
    required this.fest,
    required this.events,
  }) : super(key: key);

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
                onTapped: () =>
                    Navigator.pushNamed(context, AppRouter.registration),
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
                              style: interTextTheme.headline1,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 154,
                            child: Text(
                              widget.fest.description,
                              style: interTextTheme.bodyText1!.copyWith(
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
                  style: interTextTheme.caption!.copyWith(
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
                  Text(
                    '${categorisedEvents!.keys.toList()[0][0].toUpperCase()}${categorisedEvents.keys.toList()[0].substring(1).toLowerCase()}',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 24),
                  HighPriorityEventList(
                    events:
                        categorisedEvents[categorisedEvents.keys.toList()[0]]!,
                  ),
                  const SizedBox(height: 80),
                  Text(
                    '${categorisedEvents.keys.toList()[1][0].toUpperCase()}${categorisedEvents.keys.toList()[1].substring(1).toLowerCase()}',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 24),
                  HighPriorityEventList(
                    events:
                        categorisedEvents[categorisedEvents.keys.toList()[1]]!,
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${categorisedEvents.keys.toList()[2][0].toUpperCase()}${categorisedEvents.keys.toList()[2].substring(1).toLowerCase()}',
                        style: interTextTheme.headline2,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.allEvents,
                          arguments: {'events': widget.events},
                        ),
                        child: Text(
                          'View More',
                          style: interTextTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            height: 1.21,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  LowPriorityEventsList(
                    events:
                        categorisedEvents[categorisedEvents.keys.toList()[2]]!,
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${categorisedEvents.keys.toList()[3][0].toUpperCase()}${categorisedEvents.keys.toList()[3].substring(1).toLowerCase()}',
                        style: interTextTheme.headline2,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.allEvents,
                          arguments: {'events': widget.events},
                        ),
                        child: Text(
                          'View More',
                          style: interTextTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            height: 1.21,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  LowPriorityEventsList(
                    events:
                        categorisedEvents[categorisedEvents.keys.toList()[3]]!,
                  ),
                  const SizedBox(height: 80),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       '${categorisedEvents.keys.toList()[8]}',
                  //       style: interTextTheme.headline2,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () => Navigator.pushNamed(
                  //         context,
                  //         AppRouter.allEvents,
                  //         arguments: {'events': widget.events},
                  //       ),
                  //       child: Text(
                  //         'View More',
                  //         style: interTextTheme.bodyText1!.copyWith(
                  //           fontSize: 14,
                  //           height: 1.21,
                  //           decoration: TextDecoration.underline,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(height: 24),
                  // LowPriorityEventsList(
                  //   events:
                  //   categorisedEvents[categorisedEvents.keys.toList()[8]]!,
                  // ),
                  // const SizedBox(height: 80),
                  if ((categorisedEvents['GUEST LECTURE'] ??
                          categorisedEvents['WORKSHOPS'] ??
                          [])
                      .isNotEmpty) ...[
                    Text(
                      'Guest Lectures',
                      style: interTextTheme.headline2,
                    ),
                    const SizedBox(height: 24),
                    SpeakerEventList(
                      events: categorisedEvents['GUEST LECTURE'] ??
                          categorisedEvents['WORKSHOPS'] ??
                          [],
                    ),
                    const SizedBox(height: 80),
                  ],
                  Text(
                    'Our Schedule',
                    style: interTextTheme.headline2,
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
    Key? key,
    this.events = const [],
  }) : super(key: key);

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
    Key? key,
    required this.events,
  }) : super(key: key);

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    final partedList = partition(events, 3).toList();
    return SizedBox(
      height: 330,
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
                  const SizedBox(height: 16)
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
    Key? key,
    required this.events,
  }) : super(key: key);

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
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
