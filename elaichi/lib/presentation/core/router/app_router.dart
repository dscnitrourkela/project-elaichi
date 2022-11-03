import 'package:elaichi/presentation/core/router/app_page_route.dart';
import 'package:elaichi/presentation/home/fest/widgets/explore_page.dart';
import 'package:elaichi/presentation/home/home_page.dart';
import 'package:elaichi/presentation/sign_in/sign_in_page.dart';
import 'package:elaichi/presentation/splash/splash_page.dart';
import 'package:flutter/widgets.dart';

/// Handles the routing and navigation of the app.
class AppRouter {
  static const String splash = '/';
  static const String signIn = '/signin';
  static const String home = '/home';
  static const String explore = '/explore';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return AppPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const SplashPage(),
        );

      case signIn:
        return AppPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const SignInPage(),
        );

      case home:
        return AppPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const HomePage(),
        );
      case explore:
        return AppPageRoute(
          settings: settings,
          builder: (context) => ExplorePage(),
        );

      default:
        return AppPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => Center(
            child: Text('Page not found ${settings.name}'),
          ),
        );
    }
  }

  /// Stores all the routes of the app.
  // final appRouter = GoRouter(
  //   routes: [
  //     ///The deafult route
  //     GoRoute(
  //       path: splash,
  //       builder: (context, state) {
  //         final userRepository = UserRepository();
  //         return HomePage(
  //           userRepository: userRepository,
  //         );
  //       },
  //     ),

  //     ///The signin route
  //     GoRoute(
  //       path: signIn,
  //       builder: (context, state) {
  //         final userRepository = UserRepository();
  //         return SignInPage(
  //           userRepository: userRepository,
  //         );
  //       },
  //     ),

  //     ///The route for the home page
  //     GoRoute(
  //       path: home,
  //       builder: (context, state) {
  //         final userRepository = UserRepository();
  //         return HomePage(
  //           userRepository: userRepository,
  //         );
  //       },
  //     ),
  //   ],
  // );
}
