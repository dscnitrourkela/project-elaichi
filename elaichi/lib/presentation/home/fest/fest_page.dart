import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/feed/widgets/webmail_card.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/featured_events.dart';
import 'package:elaichi/presentation/home/fest/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FestPage extends StatefulWidget {
  const FestPage({super.key});

  @override
  State<FestPage> createState() => _FestPageState();
}

class _FestPageState extends State<FestPage> {
  late final FestBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<FestBloc>()..add(const FestEvent.started());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<FestBloc, FestState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) {
                debugPrint(error);
                return const Center(child: Text('Something Went Wrong'));
              },
              initial: (webMailState, fests) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 544,
                        child: CarouselSlider.builder(
                          itemCount: 1,
                          options: CarouselOptions(
                            height: 544,
                            autoPlay: true,
                            enableInfiniteScroll: false,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3),
                            viewportFraction: 1,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            final fest = fests[index];
                            final duration = _bloc.durationString(
                              fest.startDate,
                              fest.endDate,
                            );
                            return HeaderWidget(
                              imageUrl:
                                  fest.coverImg ?? Strings.placeholderImage,
                              leadingWidget: Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/avenue_logo.png',
                                      color: Colors.white,
                                      height: 14.5,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    SvgPicture.asset(
                                      Strings.avenueLogo,
                                      height: 12,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              trailingWidget: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockHorizontal! * 10,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: fest.logo,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) =>
                                      const Icon(Icons.circle),
                                  height: 34,
                                  width: 36,
                                ),
                              ),
                              bottomSubTitleWidget: duration != null
                                  ? DurationDates(
                                      text: duration,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      style: interTextTheme.bodySmall,
                                    )
                                  : null,
                              title: fest.name,
                              buttonTitle: 'Explore More',
                              onTapped: () async {
                                final calenderAndCategorisedEvents = await _bloc
                                    .getCalenderAndCategorisedEvents(fest.id);
                                // ignore: use_build_context_synchronously
                                return Navigator.pushNamed(
                                  context,
                                  AppRouter.explore,
                                  arguments: <String, dynamic>{
                                    'fest': fest,
                                    'events': calenderAndCategorisedEvents,
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: FutureBuilder(
                          future: _bloc.isVerified(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (!(snapshot.data as bool?)!) {
                                return const Column(
                                  children: [
                                    WebMailCard(),
                                    SizedBox(height: 36),
                                  ],
                                );
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Featured Events',
                                style: interTextTheme.displayMedium!.copyWith(
                                  letterSpacing: -0.41,
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            const FeaturedEventCard(),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
