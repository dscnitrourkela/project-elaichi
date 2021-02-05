import 'package:auto_route/auto_route_annotations.dart';
import 'package:elaichi/views.dart';


///[$AppRouter] is used to define the routes for generation using
///[auto_rote](https://pub.dev/packages/auto_route).
@MaterialAutoRouter(routes: <AutoRoute>[
  /// Initial route. Pushes [StartupView]
  MaterialRoute(page: StartupView, initial: true),

  /// [HomeView] route
  MaterialRoute(page: HomeView),
])
class $AppRouter {}
