import 'package:elaichi/app/router/app_router.dart';
import 'package:elaichi/app/theme/base_theme.dart';
import 'package:flutter/material.dart';

/// The main app.
class ElaichiApp extends StatelessWidget {
  /// Constructor of [ElaichiApp].
  ElaichiApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.appRouter.routeInformationParser,
      routerDelegate: _appRouter.appRouter.routerDelegate,
      theme: AppTheme.light,
      title: 'Avenue For NITR',
      debugShowCheckedModeBanner: false,
    );
  }
}
