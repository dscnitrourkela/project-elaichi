import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(NITRCentralApp());
}

///The main app.
class NITRCentralApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NITRCentral',
      initialRoute: Routes.startupView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
