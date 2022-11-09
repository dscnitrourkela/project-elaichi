import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/presentation/core/router/app_page_route.dart';
import 'package:elaichi/presentation/home/fest/explore/all_events/all_events_page.dart';
import 'package:elaichi/presentation/home/fest/explore/event_details_page.dart';
import 'package:elaichi/presentation/home/fest/explore/explore_page.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/registration.dart';
import 'package:elaichi/presentation/home/home_page.dart';
import 'package:elaichi/presentation/sign_in/sign_in_page.dart';
import 'package:elaichi/presentation/splash/splash_page.dart';
import 'package:flutter/widgets.dart';

/// Handles the routing and navigation of the app.
class AppRouter {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String eventDetails = '/eventDetails';
  static const String allEvents = '/allEvents';
  static const String registration = '/registration';

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
        final map = settings.arguments! as Map<String, dynamic>;
        return AppPageRoute(
          settings: settings,
          builder: (context) => ExplorePage(
            fest: map['fest'] as Org,
            events: map['events'] as Map<String, Map<String, List<Event>>>,
          ),
        );

      case eventDetails:
        final map = settings.arguments! as Map<String, dynamic>;
        return AppPageRoute(
          settings: settings,
          builder: (context) => EventDetailsPage(event: map['event'] as Event),
        );

      case allEvents:
        final map = settings.arguments! as Map<String, dynamic>;
        return AppPageRoute(
          settings: settings,
          builder: (context) => AllEventsPage(
            events: map['events'] as Map<String, Map<String, List<Event>>>,
          ),
        );

      case registration:
        return AppPageRoute(
          settings: settings,
          builder: (context) => const StudentConfirmationPage(),
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
