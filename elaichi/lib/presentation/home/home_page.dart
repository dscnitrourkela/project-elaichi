import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/home/cubit/home_cubit.dart';
import 'package:elaichi/presentation/home/fest/fest_page.dart';
import 'package:elaichi/presentation/home/widgets/bottom_navbar_items.dart';
import 'package:elaichi/presentation/mail/webmail_page.dart';
import 'package:elaichi/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The Landing Page of the app.
class HomePage extends StatefulWidget {
  ///Default Constructor for [HomePage]
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

///To manage the state of [HomePage]
class _HomePageState extends State<HomePage> {
  late final HomeCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<HomeCubit>()..checkIfVerified();
    super.initState();
  }

  /// to maintain the page index of the bottom navigation bar
  // int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const FestPage(),
          loading: () => const Center(child: CircularProgressIndicator()),
          isVerifiedUser: (pageIndex) => Scaffold(
            body: IndexedStack(
              index: pageIndex,
              children: const [
                WebMailPage(),
                FestPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 18,
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (int value) async {
                  _cubit.checkIfVerified(pageIndex: value);
                },
                currentIndex: pageIndex,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Theme.of(context).hintColor,
                selectedIconTheme: const IconThemeData(size: 32),
                backgroundColor: Theme.of(context).canvasColor,
                iconSize: 28,
                type: BottomNavigationBarType.fixed,
                elevation: 16,
                items: navBarItems(
                  profileImage: _cubit.userImage,
                  isVerifiedUser: true,
                ),
              ),
            ),
          ),
          isRegisteredUser: (pageIndex) => Scaffold(
            body: IndexedStack(
              index: pageIndex,
              children: const [
                // FeedPage(),
                // BrowsePage(),
                FestPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 18,
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (int value) {
                  _cubit.checkIfVerified(pageIndex: value);
                },
                currentIndex: pageIndex,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Theme.of(context).hintColor,
                selectedIconTheme: const IconThemeData(size: 32),
                backgroundColor: Theme.of(context).canvasColor,
                iconSize: 28,
                type: BottomNavigationBarType.fixed,
                elevation: 16,
                items: navBarItems(
                  profileImage: _cubit.userImage,
                  isVerifiedUser: false,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
