import 'package:easy_localization/easy_localization.dart';
import 'package:elaichi/core.dart';
import 'package:elaichi/src/generated/codegen_loader.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
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
      child: const ElaichiApp(),
    ),
  );
}
