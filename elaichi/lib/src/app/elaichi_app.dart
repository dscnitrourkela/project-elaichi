import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/core.dart';

import 'package:elaichi/src/generated/locale_keys.g.dart';
import 'package:elaichi/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

/// The main app.
class ElaichiApp extends StatelessWidget {
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
            child: child,
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          title: LocaleKeys.appName.tr(),
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          initialRoute: Routes.startupView,
          onGenerateRoute: AppRouter().onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
        ),
      ),
    );
  }
}
