import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/generated/locale_keys.g.dart';
import 'package:elaichi/ui/views/feed/feed_viewmodel.dart';
import 'package:elaichi/ui/widgets/appbar.dart';
import 'package:elaichi/ui/widgets/schedule/schedule_card.dart';
import 'package:elaichi/ui/widgets/story/story_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Landing feed page.
class FeedView extends StatelessWidget {
  /// Constructor for [FeedView]
  const FeedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
      viewModelBuilder: () => FeedViewModel(),
      onModelReady: (FeedViewModel model) => model.initialise(),
      builder: (BuildContext context, FeedViewModel model, Widget child) {
        return SafeArea(
          child: Scaffold(
            appBar: ElaichiAppbar(
              title: LocaleKeys.homeTitle.tr(),
              appbarHeight: 76,
            ),
            body: model.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: <Widget>[
                      const StoryBar(),
                      const ScheduleCard(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
