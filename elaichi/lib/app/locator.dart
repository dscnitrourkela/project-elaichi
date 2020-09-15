import 'package:get_it/get_it.dart';
import 'package:elaichi/app/locator.config.dart';
import 'package:injectable/injectable.dart';

///Global [GetIt] instance used to inject dependencies.
final GetIt locator = GetIt.instance;

///[setupLocator()] is called before runApp() to register the dependencies with
///[GetIt] and make them available for injection.
@injectableInit
void setupLocator() => $initGetIt(locator, environment: 'fake');
