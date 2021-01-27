import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/router.gr.dart' as router;
import 'package:elaichi/app/themes/base_theme.dart';
import 'package:elaichi/generated/codegen_loader.g.dart';
import 'package:elaichi/generated/locale_keys.g.dart';
import 'package:elaichi/ui/utils/no_over_scroll.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  await ThemeManager.initialise();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await Firebase.initializeApp();
  Logger.level = Level.debug;
  setupLocator(environment: Env.dev);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const <Locale>[Locale('en')],
      path: 'assets/translations',
      child: ElaichiApp(),
    ),
  );
}

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
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        builder: (context, child) => ScrollConfiguration(
          behavior: NoOverScrollBehavior(),
          child: child,
        ),
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
