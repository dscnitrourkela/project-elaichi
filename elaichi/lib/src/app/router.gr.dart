// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../datamodels.dart';
import '../../views.dart';
import '../ui/views/signin/signin_view.dart';
import '../ui/views/signup/signup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home-view';
  static const String clubView = '/club-view';
  static const String viewEvent = '/view-event';
  static const String signinView = '/signin-view';
  static const String signupView = '/signup-view';
  static const all = <String>{
    startupView,
    homeView,
    clubView,
    viewEvent,
    signinView,
    signupView,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.clubView, page: ClubView),
    RouteDef(Routes.viewEvent, page: ViewEvent),
    RouteDef(Routes.signinView, page: SigninView),
    RouteDef(Routes.signupView, page: SignupView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ClubView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ClubView(),
        settings: data,
      );
    },
    ViewEvent: (data) {
      final args = data.getArgs<ViewEventArguments>(
        orElse: () => ViewEventArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ViewEvent(
          key: args.key,
          event: args.event,
        ),
        settings: data,
      );
    },
    SigninView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SigninView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ViewEvent arguments holder class
class ViewEventArguments {
  final Key key;
  final Event event;
  ViewEventArguments({this.key, this.event});
}
