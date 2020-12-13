import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/router.gr.dart' as router;
import 'package:elaichi/services/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  Logger.level = Level.debug;
  setupLocator(environment: Env.dev);
  runApp(EasyLocalization(
    supportedLocales: const <Locale>[Locale('en')],
    path: 'assets/translations',
    child: NITRCentralApp(),
  ));
}

///The main app.
class NITRCentralApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeModel>.reactive(
      onModelReady: (model) => model.initialiseTheme(),
      viewModelBuilder: () => ThemeModel(),
      builder: (context, model, child) => AnimatedTheme(
        isMaterialAppTheme: true,
        curve: Curves.slowMiddle,
        duration: const Duration(milliseconds: 500),
        data: model.data ?? ThemeData(),
        child: model.data != null
            ? MaterialApp(
                theme: model.data,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                title: 'appName'.tr(),
                initialRoute: router.Routes.startupView,
                onGenerateRoute: router.Router().onGenerateRoute,
                navigatorKey: locator<NavigationService>().navigatorKey,
              )
            : const MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
      ),
    );
  }
}

// ignore: public_member_api_docs
class ThemeModel extends StreamViewModel<ThemeData> {
  final ThemeManager _themeManager = locator<ThemeManager>();

  ThemeData _themeData;

  /// Returns current theme
  ThemeData get theme => _themeData;
  @override
  void initialise() {
    // TODO: implement initialise
    _themeData = data;
    super.initialise();
  }

  @override
  Stream<ThemeData> get stream => _themeManager.theme;

  /// Sets initial theme of the app.
  void initialiseTheme() {
    _themeManager.changeTheme();
  }
}
