import 'package:elaichi/ui/views/club/club_viewmodel.dart';
import 'package:elaichi/ui/widgets/club/club_appbar.dart';
import 'package:elaichi/ui/widgets/club/all%20events/club_event_list.dart';
import 'package:elaichi/ui/widgets/club/stories%20archive/club_story_gridview.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Page for info about individual clubs
class ClubView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClubViewModel>.reactive(
      builder: (BuildContext context, ClubViewModel model, Widget child) {
        return Scaffold(
          body: model.isBusy
              ? Center(
                  child: const CircularProgressIndicator(),
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
                            iconTheme: const IconThemeData(color: Colors.white),
                            backgroundColor: const Color(0xff1f2253),
                            flexibleSpace: FlexibleSpaceBar(
                              background: Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    color: Color(
                                      int.parse(
                                          '0xff${club.theme.backgroundColor}'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 28),
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
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(56.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: double.maxFinite,
                                  color: const Color(0xff1f2253),
                                  child: const TabBar(
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
        );
      },
      viewModelBuilder: () => ClubViewModel(),
      // TODO: Generalise this hardcoded club id
      onModelReady: (ClubViewModel model) => model.initialise(42),
    );
  }
}
