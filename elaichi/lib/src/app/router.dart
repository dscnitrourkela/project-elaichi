import 'package:auto_route/auto_route_annotations.dart';
import 'package:elaichi/views.dart';

/// $Router is used to define the routes for generation using
/// [auto_route](https://pub.dev/packages/auto_route).
@MaterialAutoRouter(routes: <AutoRoute>[
  /// Initial route. Pushes [StartupView]
  MaterialRoute(page: StartupView, initial: true),

  /// [HomeView] route
  MaterialRoute(page: HomeView),

  ///[ClubView] route
  MaterialRoute(page: ClubView),

  ///[ViewEvent] route
  MaterialRoute(page:ViewEvent)
])
class $AppRouter {}
