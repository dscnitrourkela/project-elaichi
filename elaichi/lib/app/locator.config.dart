// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api.dart';
import '../services/fake_api.dart';
import '../services/feed_service.dart';
import '../services/local_db.dart';
import '../services/theme_manager.dart';
import '../services/third_party_services_module.dart';

/// Environment names
const _dev = 'dev';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<Api>(() => FakeApi(), registerFor: {_dev});
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<FeedService>(() => FeedService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);

  // Eager singletons must be registered in the right order
  gh.singleton<LocalDb>(LocalDb());
  gh.singleton<ThemeManager>(ThemeManager());
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
