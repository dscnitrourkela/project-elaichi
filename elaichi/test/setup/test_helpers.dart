import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/localization.dart';
import 'package:elaichi/app/locator.dart';
import 'package:elaichi/generated/codegen_loader.g.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:elaichi/services/api.dart';
import 'package:elaichi/services/fake_api.dart';
import 'package:elaichi/services/feed_service.dart';
import 'package:elaichi/services/theme_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class SnackbarServiceMock extends Mock implements SnackbarService {}

class ThemeManagerMock extends Mock implements ThemeManager {}

class LocalDbMock extends Mock implements LocalDb {}

class FakeApiMock extends Mock implements FakeApi {}

class FeedServiceMock extends Mock implements FeedService {}

FakeApi getAndRegisterFakeApiMock() {
  _removeRegistrationIfExists<Api>();
  final service = FakeApiMock();
  locator.registerSingleton<Api>(service);
  return service;
}

FeedService getAndRegisterFeedServiceMock() {
  _removeRegistrationIfExists<FeedService>();
  final service = FeedServiceMock();
  locator.registerSingleton<FeedService>(service);
  return service;
}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  final service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

DialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogService>();
  final service = DialogServiceMock();
  locator.registerSingleton<DialogService>(service);
  return service;
}

SnackbarService getAndRegisterSnackbarServiceMock() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = SnackbarServiceMock();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

ThemeManager getAndRegisterThemeManagerMock() {
  _removeRegistrationIfExists<ThemeManager>();
  final service = ThemeManagerMock();
  locator.registerSingleton<ThemeManager>(service);
  return service;
}

LocalDb getAndRegisterLocalDbMock() {
  _removeRegistrationIfExists<LocalDb>();
  final service = LocalDbMock();
  locator.registerSingleton<LocalDb>(service);
  return service;
}

Future<void> loadAssets() async {
  final r = Resource(
      locale: const Locale('en'),
      path: 'path',
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader());
  await r.loadTranslations();
  Localization.load(const Locale('en'), translations: r.translations);
}

Future<void> registerServices() async {
  await loadAssets();
  locator.allowReassignment = true;
  getAndRegisterDialogServiceMock();
  getAndRegisterNavigationServiceMock();
  getAndRegisterSnackbarServiceMock();
  getAndRegisterThemeManagerMock();
  getAndRegisterLocalDbMock();
  getAndRegisterFakeApiMock();
  getAndRegisterFeedServiceMock();
}

void unregisterServices() {
  locator.unregister<DialogService>();
  locator.unregister<NavigationService>();
  locator.unregister<SnackbarService>();
  locator.unregister<ThemeManager>();
  locator.unregister<LocalDb>();
  locator.unregister<Api>();
  locator.unregister<FeedService>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) locator.unregister<T>();
}
