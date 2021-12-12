import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:elaichi/home/application/home_cubit.dart';
import 'package:elaichi/home/presentation/widgets/bottomnavbaritems.dart';
import 'package:elaichi/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// The Landing Page of the app.
class HomePage extends StatelessWidget {
  /// Constructor for [HomePage].
  const HomePage({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

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
                feedPage: () {
                  context.read<HomeCubit>().pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                },
                browsePage: () {
                  context.read<HomeCubit>().pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                },
                emailPage: () {
                  context.read<HomeCubit>().pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                },
                profilePage: () {
                  context.read<HomeCubit>().pageController.animateToPage(
                        3,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                },
                logOut: () => GoRouter.of(context).go('/'),
                success: () => GoRouter.of(context).go('/home'),
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
                      child: Column(
                        children: <Widget>[
                          Button(
                            text: 'Log Out',
                            onTapped: () => context.read<HomeCubit>().logOut(),
                          ),
                          PageView(
                            // TO-DO - Add the pages
                            controller:
                                context.read<HomeCubit>().pageController,
                            scrollBehavior: const ScrollBehavior(),
                            onPageChanged: (value) {
                              context.read<HomeCubit>().pageIndex = value;
                              context.read<HomeCubit>().bottomNavBarClicked();
                            },
                            children: [],
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: BlocProvider.value(
                      value: BlocProvider.of<HomeCubit>(context),
                      child: BottomNavigationBar(
                        onTap: (int value) {
                          context.read<HomeCubit>().pageIndex = value;
                          context.read<HomeCubit>().bottomNavBarClicked();
                        },
                        currentIndex: context.read<HomeCubit>().pageIndex,
                        selectedItemColor: Theme.of(context).primaryColor,
                        unselectedItemColor: Theme.of(context).disabledColor,
                        backgroundColor: Theme.of(context).backgroundColor,
                        iconSize: 28,
                        type: BottomNavigationBarType.fixed,
                        elevation: 6,
                        items: navBarItems,
                      ),
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
