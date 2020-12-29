import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/router.gr.dart' as router;
import 'package:elaichi/app/themes/base_theme.dart';
import 'package:elaichi/generated/codegen_loader.g.dart';
import 'package:elaichi/generated/locale_keys.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  await ThemeManager.initialise();
  await Firebase.initializeApp();
  Logger.level = Level.debug;
  setupLocator(environment: Env.dev);
  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const <Locale>[Locale('en')],
      path: 'assets/translations',
      child: NITRCentralApp(),
    ),
  );
}

/// The main app.
class NITRCentralApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      lightTheme: BaseTheme.light,
      darkTheme: BaseTheme.dark,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: LocaleKeys.appName.tr(),
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        initialRoute: router.Routes.startupView,
        onGenerateRoute: router.Router().onGenerateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
