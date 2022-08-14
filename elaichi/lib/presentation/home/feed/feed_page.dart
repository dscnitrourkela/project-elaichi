import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/feed/cubit/feed_cubit.dart';
import 'package:elaichi/presentation/home/feed/widgets/announcements.dart';
import 'package:elaichi/presentation/home/feed/widgets/articles/article_list.dart';
import 'package:elaichi/presentation/home/feed/widgets/timetable/calender_list.dart';
import 'package:elaichi/presentation/home/feed/widgets/webmail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///The Feed Page
class FeedPage extends StatelessWidget {
  /// Default constructor
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = FeedCubit(userRepository: context.read<UserRepository>());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Feed'),
      body: BlocProvider(
        create: (context) => _cubit,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal! * 4,
              ),
              child: BlocBuilder<FeedCubit, FeedState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => Column(
                      children: [
                        if (state == const FeedState.webMailAuthenticated())
                          const CalenderList(),
                        if (state == const FeedState.webMailUnauthenticated())
                          const WebMailCard(),
                        const ArticleList(),
                        const Announcements()
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
