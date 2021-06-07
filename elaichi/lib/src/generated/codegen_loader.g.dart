// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "appName": "Avenue",
    "fullAppName": "Avenue for NITR",
    "forNitr": "for NITR",
    "signInWithGoogle": "Sign in with Google",
    "completeSignup": "Complete Signup",
    "username": "Username",
    "password": "Password",
    "mobile": "Mobile",
    "optional": "Optional",
    "welcome": "Welcome to NITR Central",
    "homeTitle": "Your Feed",
    "timeTable": "Timetable",
    "openCalendar": "Open Calendar",
    "thisWeekTitle": "Stories This Week"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"en": en};
}
