import 'package:elaichi/presentation/browse/browse_page.dart';
import 'package:elaichi/presentation/home/bloc/home_bloc.dart';
import 'package:elaichi/presentation/home/feed/feed_page.dart';
import 'package:elaichi/presentation/home/widgets/bottom_navbar_items.dart';
import 'package:elaichi/presentation/mail/webmail_page.dart';
import 'package:elaichi/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The Landing Page of the app.
class HomePage extends StatefulWidget {
  ///Default Constructor for [HomePage]
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

///To manage the state of [HomePage]
class _HomePageState extends State<HomePage> {
  late final HomeBloc _bloc;

  @override
  void initState() {
    _bloc = HomeBloc();
    super.initState();
  }

  /// to maintain the page index of the bottom navigation bar
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => _bloc,
      child: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            state.maybeWhen<dynamic>(
              orElse: () {},
              error: (error) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                ),
              ),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Scaffold(
                  body: Center(
                    child: const [
                      FeedPage(),
                      BrowsePage(),
                      WebMailPage(),
                      ProfilePage(),
                    ][pageIndex],
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    onTap: (int value) {
                      setState(() {
                        pageIndex = value;
                      });
                    },
                    currentIndex: pageIndex,
                    selectedItemColor: Theme.of(context).primaryColor,
                    unselectedItemColor: Theme.of(context).hintColor,
                    selectedIconTheme: const IconThemeData(size: 32),
                    backgroundColor: Theme.of(context).canvasColor,
                    iconSize: 28,
                    type: BottomNavigationBarType.fixed,
                    elevation: 16,
                    items: navBarItems,
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
