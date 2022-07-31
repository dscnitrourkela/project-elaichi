import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/browse/browse_page.dart';
import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/home/bloc/home_bloc.dart';
import 'package:elaichi/presentation/home/feed/feed_page.dart';
import 'package:elaichi/presentation/home/widgets/bottomnavbaritems.dart';
import 'package:elaichi/presentation/mail/mail_page.dart';
import 'package:elaichi/presentation/user_settings/account/account_page.dart';
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
    _bloc = HomeBloc(userRepository: context.read<UserRepository>());
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
              loggedOut: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouter.splash,
                (route) => false,
              ),
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
                  ///For Loging Out uncomment this and use this button.
                  appBar: CustomAppBar(
                    title: 'AVENUE DEVELOP',
                    rightButton: Icons.logout_rounded,
                    rightTap: () => _bloc.add(const HomeEvent.logout()),
                  ),
                  body: Center(
                    child: PageView(
                      controller: _bloc.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollBehavior: const ScrollBehavior(),
                      onPageChanged: (value) {
                        setState(() {
                          pageIndex = value;
                        });
                        _bloc.pageController.jumpToPage(value);
                      },
                      children: const [
                        FeedPage(),
                        BrowsePage(),
                        MailPage(),
                        ProfilePage(),
                      ],
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    onTap: (int value) {
                      setState(() {
                        pageIndex = value;
                      });
                      _bloc.pageController.animateToPage(
                        value,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                      );
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
