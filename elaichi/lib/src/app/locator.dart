import 'package:get_it/get_it.dart';

/// Global [GetIt] instance used to inject dependencies.
//final GetIt locator = GetIt.instance;

/// [setupLocator()] is called before runApp() to register the dependencies with
/// [GetIt] and make them available for injection.
//@injectableInit
//void setupLocator({String? environment}) => $initGetIt(
//locator,
//environment: environment,
//);

/// Custom class to define configurations for multiple environemnts.
abstract class Env {
  /// Pass this as an argument to the environment parameter of setupLocator
  /// to register development dependencies.
  static const dev = 'dev';

  /// Pass this as an argument to the environment parameter of setupLocator
  /// to register production dependencies.
  static const prod = 'prod';
}
