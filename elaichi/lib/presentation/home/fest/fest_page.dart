import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elaichi/data/remote/notification_service.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
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
  const FestPage({Key? key}) : super(key: key);

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
                          itemCount: fests.length,
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
                              leadingWidget: SvgPicture.asset(
                                Strings.avenueLogo,
                                height: 18,
                                color: Colors.white,
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
                                  width: 32,
                                ),
                              ),
                              bottomSubTitleWidget: duration != null
                                  ? DurationDates(
                                      text: duration,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      style: interTextTheme.caption,
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
                        child: Column(
                          children: [
                            if (!_bloc.isRegistered()) const WebMailCard(),
                            if (!_bloc.isRegistered())
                              const SizedBox(height: 32),
                            // const FeaturedEvents(),
                          ],
                        ),
                      )
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
