import 'package:elaichi/app/locator.dart';
import 'package:elaichi/services/api.dart';
import 'package:elaichi/services/fake_api.dart';
import 'package:elaichi/services/theme_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class SnackbarServiceMock extends Mock implements SnackbarService {}

class ThemeManagerMock extends Mock implements ThemeManager {}

class FakeApiMock extends Mock implements FakeApi {}

FakeApi getAndRegisterFakeApiMock() {
  _removeRegistrationIfExists<Api>();
  final service = FakeApiMock();
  locator.registerSingleton<Api>(service);
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

void registerServices() {
  locator.allowReassignment = true;
  getAndRegisterDialogServiceMock();
  getAndRegisterNavigationServiceMock();
  getAndRegisterSnackbarServiceMock();
  getAndRegisterThemeManagerMock();
  getAndRegisterFakeApiMock();
}

void unregisterServices() {
  locator.unregister<DialogService>();
  locator.unregister<NavigationService>();
  locator.unregister<SnackbarService>();
  locator.unregister<ThemeManager>();
  locator.unregister<Api>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) locator.unregister<T>();
}
