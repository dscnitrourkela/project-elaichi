import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/feed/widgets/webmail_card.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/home/fest/widgets/featured_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FestPage extends StatelessWidget {
  const FestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = FestBloc(
      eventRepository: context.read<EventRepository>(),
      userRepository: context.read<UserRepository>(),
    );
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: Stack(
          children: [
            const HeaderWidget(),
            DraggableScrollableSheet(
              initialChildSize: 0.365,
              minChildSize: 0.365,
              builder: (context, scrollController) => SizedBox(
                width: SizeConfig.screenWidth,
                height: 300,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17.5,
                      vertical: 20,
                    ),
                    child: Column(
                      children: const [
                        WebMailCard(),
                        FeaturedEvents(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
          height: 430,
          fit: BoxFit.fill,
        ),
        Positioned.fill(
          bottom: 124,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'HackNITR 4.0',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Positioned.fill(
          top: 64,
          left: 16,
          child: Text(
            'AVENUE',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          top: 64,
          right: 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              SizeConfig.safeBlockHorizontal! * 10,
            ),
            child: CachedNetworkImage(
              imageUrl: Splash.instance().getUser!.photoURL.toString(),
              fit: BoxFit.fill,
              placeholder: (context, url) => const Icon(Icons.circle),
              height: 34,
              width: 32,
            ),
          ),
        ),
        Positioned.fill(
          bottom: 88,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  'Jan 03 - Jan 07 2023',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 24,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 125,
                  vertical: 14,
                ),
                backgroundColor: AppColors.yellowButton,
              ),
              onPressed: () {},
              child: Text(
                'Explore More',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
