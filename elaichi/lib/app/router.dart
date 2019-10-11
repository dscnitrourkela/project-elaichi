import 'package:auto_route/auto_route_annotations.dart';
import 'package:elaichi/ui/views/home/home_view.dart';
import 'package:elaichi/ui/views/startup/startup_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
  HomeView homeViewRoute;
}