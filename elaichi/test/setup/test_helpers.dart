import 'package:elaichi/app/locator.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class SnackbarServiceMock extends Mock implements SnackbarService {}

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

void registerServices() {
  getAndRegisterDialogServiceMock();
  getAndRegisterNavigationServiceMock();
  getAndRegisterSnackbarServiceMock();
}

void unregisterServices() {
  locator.unregister<DialogService>();
  locator.unregister<NavigationService>();
  locator.unregister<SnackbarService>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) locator.unregister<T>();
}
