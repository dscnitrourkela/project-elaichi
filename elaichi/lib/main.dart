import 'package:elaichi/presentation/core/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0.2),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(await ElaichiApp.run());
}
