import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/core.dart';
import 'package:elaichi/services.dart';
import 'package:elaichi/theme.dart';
import 'package:elaichi/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

/// The main app.
@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ClubView),
    MaterialRoute(page: ViewEvent),
    MaterialRoute(page: SigninView),
    MaterialRoute(page: SignupView)
  ],
  dependencies: [
    LazySingleton(classType: FakeApi, asType: Api, environments: {Env.dev}),
    LazySingleton(classType: Auth),
    Singleton(classType: GraphQL),
    Singleton(classType: LocalDb),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
  ],
)
class ElaichiApp extends StatelessWidget {
  /// Constructor for ElaichiApp.
  const ElaichiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black));
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      lightTheme: AppTheme.light,
      darkTheme: AppTheme.dark,
      builder: (context, regularTheme, darkTheme, themeMode) => Portal(
        child: MaterialApp(
          builder: (context, child) => ScrollConfiguration(
            behavior: NoOverScrollBehavior(),
            child: child!,
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          title: LocaleKeys.appName.tr(),
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
        ),
      ),
    );
  }
}
