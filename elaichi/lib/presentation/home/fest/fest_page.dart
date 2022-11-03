import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/feed/widgets/webmail_card.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/home/fest/widgets/custom_draggable_sheet.dart';
import 'package:elaichi/presentation/home/fest/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/widgets/featured_events.dart';
import 'package:elaichi/presentation/home/fest/widgets/header_widget.dart';
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
            HeaderWidget(
              imageUrl:
                  'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
              leadingWidget: Text(
                'AVENUE',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white),
              ),
              trailingWidget: ClipRRect(
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
              bottomSubTitleWidget: const DurationDates(
                text: 'Jan 03 - Jan 07 2023',
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              title: 'HackNITR 4.0',
              buttonTitle: 'Explore More',
              onTapped: () => Navigator.pushNamed(context, AppRouter.explore),
            ),
            const CustomDraggableSheet(
              children: [
                WebMailCard(),
                FeaturedEvents(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
