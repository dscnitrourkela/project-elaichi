import 'package:elaichi/ui/views/club/club_viewmodel.dart';
import 'package:elaichi/ui/widgets/club/all%20events/club_event_list.dart';
import 'package:elaichi/ui/widgets/club/stories%20archive/club_story_gridview.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Page for info about individual clubs
class ClubView extends StatefulWidget {
  @override
  _ClubViewState createState() => _ClubViewState();
}

class _ClubViewState extends State<ClubView> {
  final GlobalKey _key = LabeledGlobalKey('super_access_icon');

  OverlayEntry _overlayEntry;

  Size buttonSize;

  Offset buttonPosition;

  bool isMenuOpen = false;

  double opacityLevel = 0;

  void findButton() {
    final RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height / 3.3,
          left: buttonPosition.dx - buttonSize.width * 3.3,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SizedBox(
              width: buttonSize.width * 4,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 4),
                opacity: opacityLevel,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Add New',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: const Color(0xff4F4F4F),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Divider(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Row(
                            children: [
                              Image.asset('assets/images/add_story_icon.png'),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Story',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          color: const Color(0xff828282),
                                          fontWeight: FontWeight.w500),
                                ),
                              )),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.black26, size: 14),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Row(
                            children: [
                              Image.asset('assets/images/add_event_icon.png'),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'Event',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                            color: const Color(0xff828282),
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black26,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openMenu(BuildContext context) {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

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
                              actions: [
                                IconButton(
                                  key: _key,
                                  icon: const Icon(
                                    Icons.add_circle_rounded,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      opacityLevel = 1;
                                    });
                                    if (isMenuOpen) {
                                      closeMenu();
                                    } else {
                                      openMenu(context);
                                    }
                                  },
                                )
                              ],
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
          ),
        );
      },
      viewModelBuilder: () => ClubViewModel(),
      // TODO: Generalise this hardcoded club id
      onModelReady: (ClubViewModel model) => model.initialise(42),
    );
  }
}
