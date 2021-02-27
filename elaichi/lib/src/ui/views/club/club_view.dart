import 'package:elaichi/src/ui/views/club/club_viewmodel.dart';
import 'package:elaichi/src/ui/widgets/club/all_events/club_event_list.dart';
import 'package:elaichi/src/ui/widgets/club/stories_archive/club_story_gridview.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Page for info about individual clubs
class ClubView extends StatefulWidget {
  @override
  _ClubViewState createState() => _ClubViewState();
}

class _ClubViewState extends State<ClubView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClubViewModel>.reactive(
      builder: (BuildContext context, ClubViewModel model, Widget child) {
        return SafeArea(
          child: Scaffold(
            body: model.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : model.club.fold(
                    (failure) => Text(failure.toString()),
                    (club) => DefaultTabController(
                      length: 3,
                      child: NestedScrollView(
                        headerSliverBuilder: (context, value) {
                          return [
                            SliverAppBar(
                              expandedHeight: 220.0,
                              floating: true,
                              pinned: true,
                              iconTheme:
                                  const IconThemeData(color: Colors.white),
                              backgroundColor: const Color(0xff1f2253),
                              flexibleSpace: FlexibleSpaceBar(
                                background: Stack(
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      height: double.maxFinite,
                                      color: Color(int.parse(
                                          '0xff${club.theme.backgroundColor}')),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 36),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Image.asset(club.theme.logo),
                                          ),
                                          Text(
                                            club.clubName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              bottom: const PreferredSize(
                                preferredSize: Size.fromHeight(56.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                    isScrollable: true,
                                    indicatorColor: Colors.white,
                                    tabs: [
                                      Tab(text: 'All events'),
                                      Tab(text: 'Stories Archive'),
                                      Tab(text: 'Club Info'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ];
                        },
                        body: TabBarView(
                          children: [
                            ClubEventList(),
                            ClubStoryGrid(),
                            ClubEventList(),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
      viewModelBuilder: () => ClubViewModel(),
      // TODO: Generalise this hardcoded club id
      onModelReady: (ClubViewModel model) => model.initialise(42),
    );
  }
}
