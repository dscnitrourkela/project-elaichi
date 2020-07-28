// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/get_it_helper.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/local_db.dart';
import '../services/api.dart';
import '../services/fake_api.dart';
import '../services/theme_manager.dart';
import '../services/third_party_services_module.dart';

/// Environment names
const _fake = 'fake';

/// adds generated dependencies
/// to the provided [GetIt] instance

// ignore: public_member_api_docs
void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<Api>(() => FakeApi(),
      instanceName: 'fakeApi', registerFor: {_fake});
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);

  // Eager singletons must be registered in the right order
  gh.singleton<LocalDb>(LocalDb());
  gh.singleton<Api>(Api());
  gh.singleton<ThemeManager>(ThemeManager());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
