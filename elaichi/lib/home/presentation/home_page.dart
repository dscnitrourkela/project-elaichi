import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:elaichi/browse/presentation/browse_page.dart';
import 'package:elaichi/feed/application/feed_cubit.dart';
import 'package:elaichi/feed/presentation/feed_page.dart';
import 'package:elaichi/home/application/home_cubit.dart';
import 'package:elaichi/home/presentation/widgets/bottomnavbaritems.dart';
import 'package:elaichi/mail/mail.dart';
import 'package:elaichi/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// The Landing Page of the app.
class HomePage extends StatefulWidget {
  ///Default Constructor for [HomePage]
  const HomePage({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  // ignore: no_logic_in_create_state
  HomePageState createState() => HomePageState(_authenticationRepository);
}

///To manage the state of [HomePage]
class HomePageState extends State<HomePage> {
  ///Default Constructor
  HomePageState(this._authenticationRepository);
  final AuthenticationRepository _authenticationRepository;

  /// to maintain the page index of the bottom navigation bar
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationRepository>.value(
      value: _authenticationRepository,
      child: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(_authenticationRepository),
        child: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                logOut: () => GoRouter.of(context).go('/'),
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
                    /*  appBar: customAppBar(
                      text: 'AVENUE DEVELOP',
                      context: context,
                      rightButton: Icons.logout_rounded,
                      rightTap: () => context.read<HomeCubit>().logOut(),
                    ), */
                    body: Center(
                      child: PageView(
                        controller: context.read<HomeCubit>().pageController,
                        scrollBehavior: const ScrollBehavior(),
                        onPageChanged: (value) {
                          setState(() {
                            pageIndex = value;
                          });
                          context
                              .read<HomeCubit>()
                              .pageController
                              .jumpToPage(value);
                        },
                        children: [
                          BlocProvider.value(
                            value: BlocProvider.of<FeedCubit>(context),
                            child: const FeedPage(),
                          ),
                          const BrowsePage(),
                          const MailPage(),
                          const ProfilePage(),
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
                        context.read<HomeCubit>().pageController.animateToPage(
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
      ),
    );
  }
}
