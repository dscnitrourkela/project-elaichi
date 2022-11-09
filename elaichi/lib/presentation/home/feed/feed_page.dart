import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/home/feed/bloc/feed_bloc.dart';
import 'package:elaichi/presentation/home/feed/widgets/announcements.dart';
import 'package:elaichi/presentation/home/feed/widgets/articles/article_list.dart';
import 'package:elaichi/presentation/home/feed/widgets/timetable/calender_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///The Feed Page
class FeedPage extends StatelessWidget {
  /// Default constructor
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = FeedBloc(
      userRepository: context.read<UserRepository>(),
      eventRepository: context.read<EventRepository>(),
    );
    return Scaffold(
      appBar: const CustomAppBar(title: 'Feed'),
      body: BlocProvider(
        create: (context) => bloc..add(const FeedEvent.started()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.5, vertical: 20),
            child: BlocConsumer<FeedBloc, FeedState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (error) => ToastUtil()
                      .showToast(mode: ToastMode.Error, title: error),
                );
              },
              builder: (context, state) {
                return Column(
                  children: [
                    state.maybeWhen(
                      orElse: () => Container(),
                      initial: (webMailState, data) {
                        if (webMailState == WebMailState.authenticated) {
                          return const CalenderList();
                        } else {
                          return Container();
                        }
                      },
                    ),
                    const ArticleList(),
                    const Announcements()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
